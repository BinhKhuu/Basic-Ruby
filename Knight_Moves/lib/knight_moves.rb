# @board: represents the chess board where each object is accessed by x,y coordinates
#* x and y are assumed to be the same i.e the board is a square 
# @board: hash table, key: [x,y] corrdinates, value: connected edges
class KnightMoves
	attr_accessor :board
	def initialize(size)
		@board = Hash.new
		gen_board(size)
	end
	#generate board
	# *size: size of board, area = size * size
	def gen_board(size)
		for x in 0..size-1
			for y in 0..size-1
				@board[[x,y]] = Square.new(x,y,size)
			end
		end
	end
	#finds one of the possible shortest path from source to destination squre
	# *source: starting square
	# *dest: destination square
	def find_path(source,dest)
		current = @board[source] 
		path = []
		visited = []
		unvisited = []
		unvisited << current
		path << @board[source].name
		while(!unvisited.empty?)
			for i in 0..current.edges.length-1
				if !visited.include?(@board[current.edges[i]]) 
					@board[current.edges[i]].prev = current
					unvisited<< @board[current.edges[i]] 
				end
			end
			visited << current
			unvisited.shift
			current = unvisited[0]
			if current == @board[dest] 
				print_path(current)
				return
			end
		end
	end

	def print_path(node)
		current = node
		path = []
		path.unshift(current.name)
		while current.prev != nil
			path.unshift(current.prev.name) 
			current = current.prev
		end
		puts "You made it in #{path.length-1} move(s)! Here's your path:"
		for i in 0..path.length-1
			print "[#{path[i]}] "
		end
		puts ""
	end

	# @edges: array of connected nodes
	# @name: string name of current square [x,y] cordinate
	# @prev: name of previous connected to to build path
	class Square
		attr_accessor :edges, :name, :prev

		def initialize(x,y,size)
			@prev = nil
			@name = "#{x.to_s},#{y.to_s}"
			@edges = [] 
			gen_edges(x,y,size)
		end

		def gen_edges(x,y,size)
			#add edges if knight moves are within the board
			@edges << [x+1,y+2] if x + 1 >= 0 && x + 1 < size && y + 2 >= 0 && y + 2 < size 
			@edges << [x+1,y-2] if x + 1 >= 0 && x + 1 < size && y - 2 >= 0 
			@edges << [x+2,y+1] if x + 2 >= 0 && x + 2 < size && y + 1 >= 0 && y + 1 < size 
 			@edges << [x+2,y-1] if x + 2 >= 0 && x + 2 < size && y - 1 >= 0 
			@edges << [x-1,y-2] if x - 1 >= 0 && y - 2 >= 0 
			@edges << [x-1,y+2] if x - 1 >= 0 && y + 2 >= 0 && y + 2 < size   
			@edges << [x-2,y-1] if x - 2 >= 0 && y - 1 >= 0
			@edges << [x-2,y+1] if x - 2 >= 0 && y + 1 >= 0 && y + 1 < size 
		end
	end
end



