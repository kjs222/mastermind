require_relative 'guess'

class Secret

  def initialize(game_size)
    @game_size = game_size
    @colors = ['R', 'G', 'B', 'Y', 'P', 'O']
    @secret_code = generate_secret
  end

  attr_reader :game_size
  attr_reader :colors
  attr_reader :secret_code

  def generate_random_color
    color_position = rand(@game_size)
    color = @colors[color_position]
  end

  def generate_secret
    @secret_code = []
    game_size.times do
      @secret_code.push(generate_random_color)
    end
    @secret_code
  end

  def how_many(color)
    @secret_code.count(color)
  end

  def how_long
    @game_size
  end

  def color_at_position(index)
    @secret_code[index]
  end

  def possible_colors
    colors[0...game_size]
  end

  def winning_guess?(guess_array)
    true if guess_array == @secret_code
  end

  def reveal_secret
    @secret_code.join
  end

end

if __FILE__ == $0
  test = Secret.new(6)
  p test.game_size
  test.generate_secret
  p test.secret_code
  p test.how_many('o')
  p test.how_many('r')
  p test.color_at_position(0)
  p test.color_at_position(4)

end
