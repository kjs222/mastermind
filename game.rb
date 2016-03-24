require_relative 'guess'
require_relative 'secret'

class Game
  def initialize
    @response = ""
    @game_type =  ""
    @game_size = ""
    @game_size_hash = {"B" => 4, "I" => 5, "A" => 6}
  end

  attr_reader :response
  attr_reader :start_time
  attr_reader :end_time
  attr_reader :duration
  attr_reader :game_type
  attr_reader :game_size
  attr_reader :game_size_hash


  def ask_user
    puts "\nWould you like to (p)lay a new game, read the (i)nstructions, or (q)uit?\n"
    @response = gets.chomp.upcase
  end

  def quit_game
    puts "\nThanks for playing.  See you again soon.\n"
  end

  def show_instructions
    puts "\nThis is how you play mastermind\n" #FINISH
  end

  def set_game_size
    puts "\nAre you a (b)eginner, (i)ntermediate or (a)dvanced player?\n"
    @game_type = gets.chomp.upcase
    @game_size = @game_size_hash[@game_type]
  end

  def initiate_game(secret)
    @start_time = Time.now
    secret.tell_board_features
  end

  def determine_duration(start, finish)
    @duration = (finish-start).to_i
  end


  def end_game(guess, secret)
    determine_duration(@start_time, Time.now)
    puts "\n\n\tCongratulations!  \n\tYou guessed the sequence '#{secret.reveal_secret}' in #{guess.num_guesses} guesses over #{@duration} seconds. \n\nPlease play again!"
  end


end

if __FILE__ == $0

end
