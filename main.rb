require_relative 'game'
require_relative 'guess'
require_relative 'secret'


game = Game.new
puts "Welcome to Mastermind!"
while game.ask_user != "Q"
  if game.response == "P"
    secret = Secret.new(game.set_game_size)
    game.initiate_game(secret)
    guess = Guess.new
    guess.request_guess
    while !guess.quit? && guess.redo_guess?(secret)
      guess.request_guess
    end

    ##This is all duplicative with above; see if i can fix
    until guess.quit? || guess.is_guess_correct?(secret)
      guess.request_guess
      while !guess.quit? && guess.redo_guess?(secret)
        guess.request_guess
      end
    end
    game.end_game(guess, secret)
  else
    game.show_instructions
  end
end

game.quit_game
