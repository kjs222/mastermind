#secret class

class Secret

  def initialize(game_size)
    @game_size = game_size
    @colors = ['r', 'g', 'b', 'y', 'p', 'o']
    @secret = []
  end

  attr_reader :game_size
  attr_reader :colors
  attr_reader :secret

  def generate_random_color
    color_position = rand(@game_size)
    color = @colors[color_position]
  end

  def generate_secret
    game_size.times do
      @secret.push(generate_random_color)
    end
  end

  def how_many(color)
    @secret.count(color)
  end

  def color_at_position(index)
    @secret[index]
  end

end

if __FILE__ == $0
  test = Secret.new(6)
  p test.game_size
  test.generate_secret
  p test.secret
  p test.how_many('o')
  p test.how_many('r')
  p test.color_at_position(0)
  p test.color_at_position(4)

end
