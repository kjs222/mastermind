class Guess
  def initialize
    @current_guess = ""
    @guess_array = []
    @guess_history = {} #hash of hashes
    @num_guesses = 0
  end


  attr_reader :current_guess
  attr_reader :guess_array
  attr_reader :num_guesses
  attr_reader :guess_history

  def request_guess
    puts "\nEnter your guess, 'h' to see guess history, or 'q' to quit this game: "
    @current_guess = gets.chomp.upcase
  end

  def quit?
     true if (@current_guess == 'Q' || @current_guess == 'QUIT')
  end

  def show_history?
    true if (@current_guess == 'H' || @current_guess == 'HISTORY')
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

  def set_guess_number
    @num_guesses  += 1
  end

  def add_to_history(secret)
    @guess_history[set_guess_number] = {:guess => @current_guess, :correct_colors => num_correct_colors(secret), :correct_placement => num_correct_placement(secret)}
  end

  def is_guess_correct?(secret)
    make_guess_array
    add_to_history(secret)
    if secret.winning_guess?(@guess_array)
      true
    else
      display_guess_feedback
      false
    end
  end

  def display_guess_feedback
    puts "\nGuess #{@num_guesses} was: #{@guess_history[@num_guesses][:guess]}"
    puts "\n\tYour guess had #{@guess_history[@num_guesses][:correct_colors]} correct color(s)."
    puts "\tYour guess had #{@guess_history[@num_guesses][:correct_placement]} in the correct place"
  end

  def display_history
    puts "\n\tYour guess history is:\n"
    guess_history.each do |guess_num, guess_info|
      puts "\t#{guess_num}.  #{guess_info[:guess]}  #{guess_info[:correct_colors]} correct color(s)   #{guess_info[:correct_placement]} correct placement(s)"
    end
    request_guess
  end




end

if __FILE__ == $0

end
