require 'csv'
# csv structure
# 0 name, 1 num_guesses, 2 duration, 3 game type
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

  # def leaderboard_file?
  #   File.exist?(@leaders_file)
  # end

  def read_leaderboard
    File.open(@leaders_file, 'a+')
    @leaders = CSV.read(@leaders_file, converters: :numeric)
  end

  def leader?(num_guesses, duration)
    true if @leaders.size < 10 || (num_guesses <= @leaders[-1][1].to_i && duration <= @leaders[-1][2].to_i)
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
      else
        return rank
      end
    end
    return @leaders.length
  end




  def add_leader(rank, name, num_guess, duration, type) #hash this?
    if @leaders.empty?
      puts "got in empty"
      @leaders.push([name, num_guess, duration, type])
    else
      puts 'got in not empty'
      puts "leaders before insert #{@leaders} end"
      @leaders.insert(rank, [name, num_guess, duration, type])
      puts "leaders after insert #{@leaders} end"
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
    #read file to command line
    #format?
  end




end

if __FILE__ == $0
  test = Leaderboard.new
  puts "before anything #{test.leaders} end"
  test.read_leaderboard
  puts "after reading #{test.leaders} end"
  p test.find_rank(6, 300)
  test.get_leader_name if test.leader?(6, 300)
  test.add_leader(test.find_rank(6, 300), test.name, 6, 300, 'b')
  p test.leaders
  test.remove_leader
  p test.leaders
  test.update_file
  CSV.foreach(test.leaders_file) { |row| p row }

  #test.create_leaderboard

end
