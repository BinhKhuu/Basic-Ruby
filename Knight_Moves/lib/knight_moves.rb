class KnightMoves
	attr_accessor :board
	def initialize(size)
		@board = Hash.new
		gen_board(size)
	end

	def gen_board(size)
		for x in 0..size-1
			for y in 0..size-1
				@board[[x,y]] = Square.new(x,y)
			end
		end
	end

	def find_path(source,dest)
		#assign source node to 0
		source.distant = 0 
		#set current = source
		current = source 
		#mark all as unvisited
		path = []
		visited = []
		unvisited = []
		unvisited << current
		path << source.name
		#for current node look at all edges 
		while(!unvisited.empty?)
			for i in 0..current.edges.length-1
				#add edges to unvisited if they have not been visited
				if !visited.include?(@board[current.edges[i]]) 
				#keep track of path
					@board[current.edges[i]].prev = current
					unvisited<< @board[current.edges[i]] 
				end
			end

			visited << current
			unvisited.shift
				#pick first edge
			current = unvisited[0]
				#if edge is the destination end
			return current if current == dest 
		end
	end

	class Square
		attr_accessor :edges, :distant, :name, :prev

		def initialize(x,y)
			@prev = nil
			@name = "#{x.to_s},#{y.to_s}"
			@edges = []
			@distant = -1 
			gen_edges(x,y)
		end

		def gen_edges(x,y)
			#add edges if knight moves are within the board
			@edges << [x+1,y+2] if x + 1 >= 0 && x + 1 <= 3 && y + 2 >= 0 && y + 2 <= 3
			@edges << [x+1,y-2] if x + 1 >= 0 && x + 1 <= 3 && y - 2 >= 0 
			@edges << [x+2,y+1] if x + 2 >= 0 && x + 2 <= 3 && y + 1 >= 0 && y + 1 <= 3
 			@edges << [x+2,y-1] if x + 2 >= 0 && x + 2 <= 3 && y - 1 >= 0 
			@edges << [x-1,y-2] if x - 1 >= 0 && y - 2 >= 0 
			@edges << [x-1,y+2] if x - 1 >= 0 && y + 2 >= 0 && y + 2 <= 3
			@edges << [x-2,y-1] if x - 2 >= 0 && y - 1 >= 0
			@edges << [x-2,y+1] if x - 2 >= 0 && y + 1 >= 0 && y + 1 <= 3
		end
	end
end


a = KnightMoves.new(4)
#puts a.board
x = a.board[[1,1]].edges[0][0]
y = a.board[[1,1]].edges[2][2]

print a.board[[3,2]].edges[0]
puts ""
#alorithm
source = a.board[[0,0]]
dest = a.board[[1,1]]
a.find_path(source,dest)


current = a.board[[1,1]]
while current.prev != nil
	
	puts current.prev.name 
	current = current.prev
end


 
#create the 8x8 graph with edges

#use dikstras alorithm to get sortest path

#record paths along the way

#win