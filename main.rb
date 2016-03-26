require_relative 'game'
require_relative 'guess'
require_relative 'secret'
require_relative 'leaderboard'


game = Game.new

puts "\n\nWelcome to Mastermind!"

while game.ask_user != "Q"  && game.response != "QUIT"

  if game.response == "P" || game.response == "PLAY"
    game_size, num_colors = game.set_game_size

    secret = Secret.new(game_size, num_colors)
    secret.generate_secret

    game.initiate_game(secret)

    guess = Guess.new
    guess.request_guess

    while !guess.quit? && guess.redo_guess?(secret)
      guess.request_guess
    end

    ##This section is duplicative with above; see if i can fix
    until guess.quit? || guess.is_guess_correct?(secret)
      guess.request_guess

      while !guess.quit? && guess.redo_guess?(secret)
        guess.request_guess
      end
    end

    if !guess.quit?
      game.end_game(guess, secret)
    end

  else
    game.show_instructions
  end

end

game.quit_game
