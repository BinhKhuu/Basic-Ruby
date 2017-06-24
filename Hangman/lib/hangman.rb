require 'yaml'

class Hangman
	attr_accessor :turns, :clue, :word, :dict_path, :bad_letters, :player

	def initialize
		parent = File.expand_path("..", Dir.pwd)
		@dict_path = parent.to_s + "/dictionary.txt"
		@turns = 0
		@clue = []
		@bad_letters = []		
		@word = gen_word
		@player = Player.new("")
		for i in 0..word.length-1
			@clue[i] = '_'
		end
	end

	def start
		#get the player details
		puts "options: (1) load, (2) new game"
		puts "enter 1 or 2:"
		mode = gets.chomp.to_i
		while mode < 1 || mode > 2 do
			system 'clear' or system 'cls'
			puts "options: (1) load, (2) new game"
			puts "enter 1 or 2:"
			mode = gets.chomp.to_i
		end
		# if new game play new game
		if mode == 2
			puts "enter 3 letter name"
			name = gets.chomp
			@player.name = name[0..2]
			puts @player.name
			play_game
		end
		# if load load game
		load if mode == 1
	end
	#run game
	def play_game
		#game begins
		finished = false
		while !finished do
			puts "\nguess the word or letter \nto save! current game enter 'save' \nleave game enter 'quit!'\n"
			display
			puts @code
			guess = gets.chomp.downcase
			if guess.length == 1
				matched = false	
				for i in 0..@word.length-1			
					if guess == @word[i]
						@clue[i] = guess 
						matched = true
					end
				end
				@bad_letters<< guess if !matched
			elsif guess.length == @word.length
				#check if word and guess correct
				if guess == @word 
					finished = true
					puts "Game over #{@player.name} you win!"
				else
					puts "Wrong!"
				end
			#if guess is larger than word no need to check
			end
			finished = true if @turns == 11
			@turns += 1 unless @turns == 11
			if guess == 'save!'
				save
				#exit game
				exit 0
			end
			exit 0 if guess == 'quit!'

		end
		puts "secret word is : #{word}"
		#load game
	end
	#display current game
	def display
		#system "clear" or system 'cls'
		print "\n#{@clue.join(' ')}\t bad letters: #{@bad_letters.join(' ')}\t turns left: #{11 - @turns}\n"
	end
	#save game
	def save
		parent = File.expand_path("..", Dir.pwd)
		puts "enter name of file:"
		file_name = gets.chomp
		File.open("#{parent}/saved_games/#{file_name}.yaml", "w") do |f|
			f.puts YAML.dump(self)
		end
		puts "game saved"
	end
	#load game
	def load
		puts "enter name of file to load:"
		file_name = gets.chomp
		parent = File.expand_path("..", Dir.pwd)
		location = "#{parent}/saved_games/#{file_name}.yaml"
		while !File.file?(location) do
			puts "file does not exist!"
			puts "enter name of file to load"
			file_name = gets.chomp
		end
		obj = YAML.load_file(location)
		@turns = obj.turns
		@clue = obj.clue
		@word = obj.word
		@bad_letters = obj.bad_letters
		@player.name = obj.player.name
		play_game
	end

	private
	def gen_word
		#open dictionary file 
		word = ""
		File.open(@dict_path,"r") do |f|
			while word.length < 5 || word.length > 12
				#return to start of file
				f.seek(0)
				indx = rand(1..61406)
				for i in 1..indx 
					f.readline
				end
				word = f.gets.chomp
			end
		end		
		word.downcase 
	end




end

class Player
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

game = Hangman.new
game.start
