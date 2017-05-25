class Game
	attr_reader :game 
	attr_reader :finish
	attr_reader :turn
	def initialize
		#create starting enviroment 
		@game = []
		for i in 0..8 do 
			@game[i] = i+1
		end
		@finish = false
		@turn = 0
	end

	def display_game
		row1 = "  #{@game[0]}  |  #{@game[1]}  |  #{@game[2]}  \n"
		row2 = "  #{@game[3]}  |  #{@game[4]}  |  #{@game[5]}  \n"
		row3 = "  #{@game[6]}  |  #{@game[7]}  |  #{@game[8]}  \n\n\n"
		div = "-----------------\n"
		puts row1 + div + row2 + div + row3
	end

	def player_move(player,position)
		unless turn == 8
			unless @game[position-1].is_a? Integer 
					puts "illegal move: position: #{position} is taken"
				else
					@game[position-1] = player
					display_game
					check_winner
				end
				@turn = @turn + 1
		else
			@finish = true
			puts "Draw! GAME OVER"
		end
	end

	private
	def check_winner
		case 
		#row 1 
		when @game[0] == "X" && @game[1] == "X" && @game[2] == "X" 
			finished("X")
		when @game[0] == "O" && @game[1] == "O" && @game[2] == "O" 
			finished("O")
		#row 2
		when @game[3] == "X" && @game[4] == "X" && @game[5] == "X" 
			finished("X")
		when @game[3] == "O" && @game[4] == "O" && @game[5] == "O" 
			finished("O")
		#row 3
		when @game[6] == "X" && @game[7] == "X" && @game[8] == "X" 
			finished("X")
		when @game[6] == "O" && @game[7] == "O" && @game[8] == "O" 
			finished("O")
		#diagonal
		when @game[0] == "X" && @game[4] == "X" && @game[8] == "X" 
			finished("X")
		when @game[0] == "O" && @game[4] == "O" && @game[8] == "O" 
			finished("O")
		end

			
	end
	
	def finished(winner)
		puts "Game over #{winner} is the winner"
		@finish = true
	end
end
