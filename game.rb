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
    puts "Would you like to (p)lay a new game, read the (i)nstructions, or (q)uit?"
    @response = gets.chomp.upcase
  end

  def quit_game
    puts "Thanks for playing.  See you again soon."
  end

  def show_instructions
    puts "This is how you play mastermind" #FINISH
  end

  def set_game_size
    puts "Are you a (b)eginner, (i)ntermediate or (a)dvanced player?"
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
    puts "Congratulations!  You guessed the sequence '#{secret.reveal_secret}' in #{guess.num_guesses} guesses over #{@duration} seconds. \nPlease play again!"
  end


end

if __FILE__ == $0
  test_game = Game.new
  # test_game.ask_user
  # test_secret = Secret.new(test_game.set_game_size)
  # test_guess = Guess.new
  p test_game.game_type = "B"
  p test_game.game_size = @game_size_hash[@game_type]

end
