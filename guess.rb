require_relative 'secret'
class Guess
  def initialize
    @guess = ""
    @guess_array = []
    @colors_hash = {'r' => 'red', 'g' => 'green', 'b' => 'blue', 'y' => 'yellow'}

  end

  attr_reader :guess
  attr_reader :guess_color_array

  def request_guess
    puts "What is your guess?"
    @guess = gets.chomp.downcase
    if @guess == 'c' || @guess == 'cheat'
      puts "I will show the secret in the future"
    elsif @guess == 'q' || @guess == 'quit'
      puts "Thanks for playing.  See you soon."
    else
      evaluate_guess
    end
  end

  # def is_guess_valid?
  #   if
  #     puts "Please enter a guess with the correct number of elements using available colors"
  #     request_guess
  #   else
  #     evaluate_guess
  # end
  def make_guess_array
    @guess_array = @guess.chars
  end

  def num_correct_colors(secret_code, colors)
    correct_colors = 0
    colors.each do |color|
      if secret_code.count(color) >= @guess_array.count(color)
        correct_colors += @guess_array.count(color)
      else
        correct_colors += secret_code.count(color)
      end
    end
    puts "#{correct_colors} are the right colors"
    correct_colors
  end

  def num_correct_placement(secret_code)
    correct_placement = 0
    @guess_array.each_with_index do |guess, index|
      correct_placement += 1 if guess == secret_code[index]
    end
    puts "#{correct_placement} are in the right place"
    correct_placement
  end

  def evaluate_guess
    make_guess_array
    num_correct_colors(['b', 'b', 'y', 'b'], ['r', 'y', 'b', 'g']) #hard coded, need to take it from secret
    if num_correct_placement(['b', 'b', 'y', 'b']) == ['b', 'b', 'y', 'b'].length
      puts "You guessed it right!"
    else
      puts "Try another guess"
      request_guess
    end

  end



  def display_secret

  end

end

if __FILE__ == $0
  test = Guess.new
  test.request_guess
end
