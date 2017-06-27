#HANGMAN game
Commandline Hangman game written in Ruby
Rules:
	secret word is between 5 and 12 characters long
	the user has 11 turns to guess the secret word
		you can guess a character or word each takes one turn
			a correct character guess will result in the letter being reveled in its character location(s) in the secret word		
			a correct guess will result in you winning the game

Functions: typed in when game is starting
	save!
		saves your current game
		you will be prompted to name the file
	quit!
		quits game

Loading a saved game
	loading a saved game is done at the beginning of running hangman.rb 
	you will be asked for the name of the saved game

How to run:
	Ruby hangman.rb
