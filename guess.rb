require_relative 'secret'

class Guess
  def initialize
    @current_guess = ""
    @guess_array = []
    @num_guesses = 0
    @colors_hash = {'r' => 'red', 'g' => 'green', 'b' => 'blue', 'y' => 'yellow'}

  end

  attr_reader :current_guess
  attr_reader :guess_color_array
  attr_reader :num_guesses

  def request_guess
    puts "Enter your guess or 'q' to quit: "
    @current_guess = gets.chomp.downcase
  end

  def is_it_a_guess?
    if @current_guess == 'c' || @current_guess == 'cheat'
      puts "The secret code is #{secret.reveal_secret}"
    elsif @current_guess == 'q' || @current_guess == 'quit'
      puts "Thanks for playing.  See you soon."
    else
      true
  end

  def is_guess_valid?(secret)
    if @current_guess.size >= secret.how_long
      puts "That's too long.  Please try another guess."
    elsif @current_guess.size <= secret.how_long
      puts "That's too short.  Please try another guess."
    else
      true
    end
  end

  def make_guess_array
    @guess_array = @current_guess.chars
  end

  def num_correct_colors(secret)
    correct_colors = 0
    secret.possible_colors.each do |color|
      if secret.how_many(color) >= @guess_array.count(color)
        correct_colors += @guess_array.count(color)
      else
        correct_colors += secret.how_many(color)
      end
    end
  end

  def num_correct_placement(secret)
    correct_placement = 0
    @guess_array.each_with_index do |current_guess, index|
      correct_placement += 1 if current_guess == secret.color_at_position(index)
    end
  end

  def evaluate_guess
    if is_it_a_guess? && is_guess_valid?(secret)
      if secret.winning_guess?(make_guess_array)
        puts "You guessed it right!"
        # ADD THE PLAY AGAIN FUNCTION CALL HERE
      else
        @num_guesses += 1
        puts "Guess #{@num_guesses}:  You have #{num_correct_colors(secret)} colors correct.\n  #{num_correct_placement(secret)} are in the correct place.\n Try again."
        request_guess
      end
    end
  end

end

if __FILE__ == $0
  test = Guess.new
  test.request_guess
end
