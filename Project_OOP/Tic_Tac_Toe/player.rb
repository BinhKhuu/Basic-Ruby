require './game.rb'
finished = false
turn = 'X'
game = Game.new

while !finished do
	puts "player #{turn}\nenter 1-9 to place your marker the board\nenter quit to end game"
	user_move = gets.chomp
	if user_move == 'quit'
		finished = true
	else
		user_move = user_move.to_i
		while user_move < 1 || user_move > 9 && user_move.to_s != 'quit' do
			puts "enter 1-9 to place your marker the board\nenter quit to end game"	
			user_move = gets.chomp.to_i
		end
		game.player_move(turn,user_move)
		if turn == 'X'
			turn = 'O'
		else
			turn = 'X'
		end
		game = Game.new if game.finish == true
	end
end