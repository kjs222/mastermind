#secret class

class Secret

  def initialize(num_elements)
    @num_elements = num_elements
    @colors = ['r', 'g', 'b', 'y']
    @secret = []
  end

  attr_reader :num_elements
  attr_reader :colors
  attr_reader :secret

  def generate_random_color
    color_position = rand(@colors.length)
    color = @colors[color_position]
  end

  def generate_secret
    num_elements.times do
      @secret.push(generate_random_color)
    end
    p @secret
  end

end

if __FILE__ == $0
  test = Secret.new(30)
  puts test.num_elements
  test.generate_secret

end
