class BinaryTree
	attr_accessor :tree 
	def initialize
		@tree = nil
	end

	def build_tree(list)
		return nil if list.length == 0
		return @tree = Node.new(list[0]) if list.length == 1
		#list had more than one element
		@tree = Node.new(list[0])
		curr_node = @tree
		for i in 1..list.length-1
			#loop until you find a place to insert
			curr_node = @tree
			inserted = false
			while(!inserted)
				#compare if less than -> move to left child
				if list[i] <= curr_node.value 
					#check if left child is occupied
					if curr_node.l_child == nil
						curr_node.l_child = Node.new(list[i])
						inserted = true
					else
						curr_node = curr_node.l_child
					end
				end

				if list[i] >= curr_node.value
					if curr_node.r_child == nil
						curr_node.r_child = Node.new(list[i])
						inserted = true
					else
						curr_node = curr_node.r_child
					end
				end
			end
		end
	end

	class Node
		attr_accessor :value, :parent, :l_child, :r_child
		
		def initialize(value = nil)
			@parent = nil
			@value = value
			@l_child = nil
			@r_child = nil
		end
	end

end


a = [4,5,3,2,7,1,10]
b = BinaryTree.new
b.build_tree(a)