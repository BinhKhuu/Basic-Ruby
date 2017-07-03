# Knight Moves 
shows one of the simplest possible way(s) for a knight to get from one square to another 


include: "knight_moves" to your ruby file

usage:
			initalize:
				create a KnightMoves object with a size paramter 

					example:
					a = KnightMoves.new(8)

					output:	this will generate an 8x8 board

			find_path
					uisng integer values create two dimensional coordinates (x,y)
					supply find_path with x and y coordinates 

					example:

					x = [3,3]
					y = [4,3]
					a.find_path(x,y)

					output : 	
									You made it in 3 move(s)! Here's your path:
									[3,3] [1,4] [3,5] [4,3] 



