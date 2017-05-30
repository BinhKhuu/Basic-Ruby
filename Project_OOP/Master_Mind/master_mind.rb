require './code_maker.rb'
require './code_breaker.rb'

class MasterMind
	attr_reader :max_turn
	attr_reader :turn_num
	attr_reader :cb_code

	def initialize
		@max_turn = 12
		@turn_num = 1
		@finished = false
		@cb_code = []
	end

	def play
		cm = CodeMaker.new()
		while !@finished do
			cb = CodeBreaker.new()
			cb.guess_code()
			unless cb.code.include? 'q'
				if @turn_num == @max_turn
					puts "game over"
					puts "code is #{cm.code}"
				elsif cm.compare(cb.code)
					puts "code is #{cm.code}"
					puts "congratulations you won!!"
					@finished = true
				else
					feed_back = cm.feed_back(cb.code)
					display(feed_back,cb.code)
				end
				@turn_num += 1
			else
				@finished = true
			end
		end
	end

	def display(feed_back,guess)
		puts ""
		puts "##################################################" 
		puts "#your guess: #{guess[0]}---#{guess[1]}---#{guess[2]}---#{guess[3]}"
		puts "#feedback: #{feed_back[0]}---#{feed_back[1]}---#{feed_back[2]}---#{feed_back[3]}"
		puts "##################################################"
		puts ""
	end
	def code_solved?

	end


end

game = MasterMind.new()
game.play()