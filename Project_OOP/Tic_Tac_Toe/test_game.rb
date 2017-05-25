require 'minitest/autorun'
require './game.rb'

g = Game.new
g.display_game

#test legal move
g.player_move("X",9)
raise "failed player legal move" unless g.game[8] == "X"

#test illegal move
g.player_move("O",9)
raise "failed player illegal move" unless g.game[8] == "X"

#test finished game
g.player_move("X",1)
g.player_move("X",2)
g.player_move("X",3)
raise "failed checking winning condition" unless g.finish == true


g = Game.new
puts g.game
g.player_move("X",1)
g.player_move("0",2)
g.player_move("X",3)
puts g.game
raise "failed passing non winning condtion" unless g.finish == false

g = Game.new
g.player_move("X",1)
g.player_move("0",5)
g.player_move("X",9)
raise "failed passing diagonal non winning condtion" unless g.finish == false

g = Game.new
g.player_move("X",1)
g.player_move("X",5)
g.player_move("X",9)
raise "failed passing diagonal winning condtion" unless g.finish == true

g = Game.new
g.player_move("X",1)
g.player_move("O",2)
g.player_move("O",3)
g.player_move("X",4)
g.player_move("0",5)
g.player_move("O",6)
g.player_move("O",7)
g.player_move("X",8)
g.player_move("X",9)
raise "failed passing draw condition" unless g.finish == true