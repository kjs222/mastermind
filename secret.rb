class Secret

  def initialize(game_size, num_colors)
    @game_size = game_size
    @num_colors = num_colors
    @secret_code = []
    @colors = ['R', 'G', 'B', 'Y', 'P', 'O'] #can refactor and get rid of this
    @colors_hash = {'R' => "(R)ed", 'G' => "(G)reen", 'B' => "(B)lue",
                    'Y' => "(Y)ellow", 'P' => "(P)urple", 'O' => "(O)range"}
  end

  attr_reader :game_size
  attr_reader :colors
  attr_reader :secret_code

  def generate_random_color
    color_position = rand(@num_colors)
    color = @colors[color_position]
  end

  def generate_secret
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
    colors[0...@num_colors]
  end

  def winning_guess?(guess_array)
    true if guess_array == @secret_code
  end

  def reveal_secret
    @secret_code.join
  end

  def tell_board_features
    puts "\nThe board has been set up with #{@game_size} elements. The board may contain the following colors:"

    color_list = @colors_hash.values[0...@num_colors].join(", ")
    puts "\n\n\t#{color_list}\n"
  end


end

if __FILE__ == $0

end
