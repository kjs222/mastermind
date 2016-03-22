#play class
class Game
  def ititialize
    @start_time = "" #figure out
    @end_time = "" #figure out
    @duration = @end_time - @start_time
    @game_type =  ""
    @num_elements = 4
  end

  attr_reader :start_time
  attr_reader :end_time
  attr_reader :duration
  attr_reader :game_type
  attr_reader :num_elements


#start game

  def start_game
    puts "Welcome to Mastermind! \nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    response = gets.chomp.downcase
    if response == 'q'
      puts "Thanks for playing.  See you again soon"
    elsif response =='i'
      show_instructions
    else
      pick_game_type
      puts "I have generated a sequence with #{@num_elements} elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
      @start_time = Time.new
    end
  end

  def pick_game_type
    puts "Are you a (b)eginner, (i)ntermediate or (a)dvanced player?"
    @game_type = gets.chomp.downcase
    set_num_elements
  end

  def set_num_elements
    if @game_type == 'b'
      @num_elements = 4
    elsif @game_type == 'i'
      @num_elements = 6
    else
      @num_elements = 8
    end
  end


  def show_instructions
    puts "This is how you play mastermind" #FINISH
    start_game
  end

  def end_game
    @end_time = Time.new
    #write stuff here.
  end


end

if __FILE__ == $0
  test = Game.new
  test.start_game
  puts test.start_time
  puts test.game_type
  puts test.num_elements

end
