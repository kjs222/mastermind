require_relative 'secret'

class Guess
  def initialize
    @current_guess = ""
    @guess_array = []
    @num_guesses = 0


  end

  attr_reader :current_guess
  attr_reader :guess_color_array
  attr_reader :num_guesses

  def request_guess
    puts "Enter your guess or 'q' to quit this game: "
    @current_guess = gets.chomp.upcase
  end

  def quit?
     true if (@current_guess == 'Q' || @current_guess == 'QUIT')
  end

  def redo_guess?(secret)
    if @current_guess == 'C' || @current_guess == 'CHEAT'
      puts "The secret code is: #{secret.reveal_secret}"
      true
    elsif @current_guess.size > secret.how_long
      puts "That's too long.  Please try another guess."
      true
    elsif @current_guess.size < secret.how_long
      puts "That's too short.  Please try another guess."
      true
    else
      false
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
    correct_colors
  end

  def num_correct_placement(secret)
    correct_placement = 0
    @guess_array.each_with_index do |current_guess, index|
      correct_placement += 1 if current_guess == secret.color_at_position(index)
    end
    correct_placement
  end


  def is_guess_correct?(secret)
    @num_guesses += 1
    make_guess_array
    if secret.winning_guess?(make_guess_array)
      puts "You guessed it right!"
      #FIX THIS LATER TO RUN END GAME FUNCTION (TRUE HAS TO BE LAST)
      true
    else

      puts "\nGuess #{@num_guesses} was: #{@current_guess}\n#{num_correct_colors(secret)} correct color(s) \n#{num_correct_placement(secret)} in the correct place\n\nTry again!"
      false
    end
  end




end

if __FILE__ == $0
  test_secret = Secret.new(4)
  test_guess = Guess.new

  p test_secret.game_size
  p test_secret.secret_code

  test_guess.request_guess
  while !test_guess.quit? && test_guess.redo_guess?(test_secret)
    test_guess.request_guess
  end

##This is all duplicative with above; see if i can fix
  until test_guess.quit? || test_guess.is_guess_correct?(test_secret)
    test_guess.request_guess
    while !test_guess.quit? && test_guess.redo_guess?(test_secret)
      test_guess.request_guess
    end
  end

end
