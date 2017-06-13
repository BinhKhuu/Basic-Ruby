
#game class
class Hangman
	attr_reader :turns
	attr_reader :win
	attr_reader :guess
	attr_reader :dict_path

	def initialize
		@turns = 0
		@win = false
		@guess = []
		parent = File.expand_path("..", Dir.pwd)
		@dict_path = parent.to_s + "/dictionary.txt"
	end

	#run game
	def run
		#get the player details
		puts "enter 3 letter player name"
		name = gets.chomp
		while name.length > 3
			system "clear" or system 'cls'
			puts "enter 3 letter player name"
			name = gets.chomp
		end
		player = Player.new(name)
		#generate the secret word
		word = gen_word
		bad_letters = []
		clue = []
		for i in 0..word.length-1
			clue[i] = '_'
		end	
		#game begins
		
		finished = false
		while !finished do
			puts "\nguess the word or letter\n"
			guess = gets.chomp.downcase
			if guess.length == 1
				matched = false	
				for i in 0..word.length-1			
					if guess == word[i]
						clue[i] = guess 
						matched = true
					end
				end
				bad_letters<< guess if !matched
			elsif guess.length == word.length
				#check if word and guess correct
				if guess == word 
					finished = true
					puts "Game over you win!"
				else
					puts "Wrong!"
				end
			#if guess is larger than word no need to check
			else
				puts "CLUE! your guess is greater than #{word.length} letters try again"
			end
			finished = true if @turns == 11
			@turns += 1 unless @turns == 11
			display(clue,bad_letters)
		end
		puts "secret word is : #{word}"

	end

	#display current game
	def display(clue,bad_letters)
		print "\n#{clue.join(' ')}\t bad letters: #{bad_letters.join(' ')}\t turns left: #{11 - @turns}\n"

	end
	#generate secret word
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

		#check if word is between 5 and 12 letters
		#return word
		word.downcase 
	end

	#save game
	def save

	end
	#load game
	def load

	end






end
#handle game logic
	#tracks turns 
	#tracks winning condition
	#tracks legal and illegal moves
	#generate secret word


#player class
	#keep record of player info
		#name

class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

game = Hangman.new
game.run