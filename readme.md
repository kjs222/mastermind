##Mastermind

####To Play:

1. Clone the repository to your machine
2. Do one of the following to start a game:
    * type `ruby main.rb` on the command line, OR
    * type `./mastermind.sh` on the command line, OR
    * put a copy the mastermind shell script into a directory that's in your computer's path OR, OR
      * type `cp mastermind.sh [path to a directory in your path]/mastermind` on the command line
      * **from now on** you can run `mastermind` from the command line **from any location**
    * put a symbolic link to the mastermind shell script into a directory that's in your computer's path.
      * navigate to the directory in your computer's path
      * type `ln -s [path to your local repo]/mastermind.sh mastermind`
      * **from now on** you can run `mastermind` from the command line **from any location**
3.  When you start a new game, you will be able to view the game instructions.

####Features:

*  Leaderboard has persistence through local storage.
*  Three levels of difficulty provided (beginner, intermediate and advanced)
*  Guess history available to assist with future guesses.


####Further Enhancements

1.  Leaderboard covers all game types (beginner, intermediate, and advanced) in one comprehensive list.  It would be better to have separate leaderboards for each game type.
2.  Secret code should be displayed on quit.
3.  Tests
