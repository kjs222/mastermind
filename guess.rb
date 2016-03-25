class Guess
  def initialize
    @current_guess = ""
    @guess_array = []
    @num_guesses = 0
  end

  attr_reader :current_guess
  attr_reader :guess_array
  attr_reader :num_guesses

  def request_guess
    puts "\nEnter your guess or 'q' to quit this game: "
    @current_guess = gets.chomp.upcase
  end

  def quit?
     true if (@current_guess == 'Q' || @current_guess == 'QUIT')
  end

  def redo_guess?(secret)
    if @current_guess == 'C' || @current_guess == 'CHEAT'
      puts "\nThe secret code is: #{secret.reveal_secret}"
      true
    elsif @current_guess.size > secret.how_long
      puts "\nThat's too long.  Please try another guess."
      true
    elsif @current_guess.size < secret.how_long
      puts "\nThat's too short.  Please try another guess."
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

  def record_guess
    @num_guesses += 1
  end


  def is_guess_correct?(secret)
    record_guess
    make_guess_array
    if secret.winning_guess?(make_guess_array)
      true
    else
      puts "\nGuess #{@num_guesses} was: #{@current_guess}\n\n\tYour guess had #{num_correct_colors(secret)} correct color(s) \n\tYour guess had #{num_correct_placement(secret)} in the correct place\n\n\tGuess again!\n\n"
      false
    end
  end

end

if __FILE__ == $0

end
