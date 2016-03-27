require 'csv'
# csv structure: 0 name, 1 num_guesses, 2 duration, 3 game type
# reference: http://www.sitepoint.com/guide-ruby-csv-library-part/

class Leaderboard
  def initialize
    @leaders_file = 'leaders.csv'
    @leaders = []
    @name = ''
  end

  attr_reader :leaders_file
  attr_reader :leaders
  attr_reader :name

  def read_leaderboard
    File.open(@leaders_file, 'a+')
    @leaders = CSV.read(@leaders_file, converters: :numeric)
  end

  def leader?(num_guesses, duration)
    true if @leaders.size < 9 || (num_guesses <= @leaders[-1][1].to_i && duration <= @leaders[-1][2].to_i)
  end

  def get_leader_name
    puts "\nYou are in the top 10! \nEnter you name to add yourself to the leaderboard: "
    @name = gets.chomp
  end

  def find_rank(num_guesses, duration)
    if @leaders.empty?
      return rank = 0
    end
    @leaders.each_with_index do |leader, rank|
      if num_guesses.to_i < leader[1].to_i
        return rank
      elsif num_guesses.to_i == leader[1].to_i
        if duration.to_i < leader[2].to_i
          return rank
        end
      end
    end
    return @leaders.length
  end

  def add_leader(rank, name, num_guess, duration, type) #hash this?
    if @leaders.empty?
      @leaders.push([name, num_guess, duration, type])
    else
      @leaders.insert(rank, [name, num_guess, duration, type])
    end
  end

  def remove_leader
    @leaders.pop if @leaders.size >= 10
  end

  def update_file
    CSV.open(@leaders_file, 'w') do |csv_object|
      @leaders.each do |leader|
        csv_object << leader
      end
    end
  end

  def display_leaders
    puts "\n\nTop 10 Leaderboard:"
    puts "\tName \t\t#Guesses \t#Seconds \tGame Type"
    @leaders.each_with_index do |leader, index|
      puts "#{index + 1}. \t#{leader[0]} \t\t#{leader[1]} \t\t#{leader[2]} \t\t#{leader[3]}"
    end
  end

  def run_leaderboard(num_guesses, duration, type)
    read_leaderboard
    if leader?(num_guesses, duration)
      add_leader(find_rank(num_guesses, duration), get_leader_name, num_guesses, duration, type)
      remove_leader
      update_file
      display_leaders
    end
  end

end
