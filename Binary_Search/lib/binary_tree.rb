class BinaryTree
	attr_accessor :tree 
	def initialize
		@tree = nil
	end
	#Take and array of integers and builds a binary tree
	#* list: array of integers
	def build_tree(list)
		return nil if list.length == 0
		return @tree = Node.new(list[0]) if list.length == 1
		@tree = Node.new(list[0])
		curr_node = @tree
		for i in 1..list.length-1
			curr_node = @tree
			inserted = false
			while(!inserted)
				if list[i] <= curr_node.value 
					if curr_node.l_child == nil
						curr_node.l_child = Node.new(list[i])
						curr_node.l_child.parent = curr_node
						inserted = true
					else
						curr_node = curr_node.l_child
					end
				elsif list[i] >= curr_node.value
					if curr_node.r_child == nil
						curr_node.r_child = Node.new(list[i])
						curr_node.r_child.parent = curr_node
						inserted = true
					else
						curr_node = curr_node.r_child
					end
				end
			end
		end
	end
	#Breadth first search
	#* input : (target) integer to search binary tree for
	#* output: node containing target or nil
	def bf_search(target)
		queue = []
		set = @tree
		queue << set
		while !queue.empty?
			current = queue.shift
			if current.value == target
				return current
			end
			queue << current.l_child if current.l_child != nil
			queue << current.r_child if current.r_child != nil
		end
		#if loop finishes no match was found
		return nil
	end

	#post order depth first search
	#* input : (target) integer to search binary tree for
	#* output: node containing target or nil
	def df_search(target)
		discovered = []
		stack = []
		current = @tree
		stack << current
		while !stack.empty?
			current = stack.pop
			return current if current.value == target
			if !discovered.include?(current)
				discovered << current
				stack << current.r_child if current.r_child != nil
				stack << current.l_child if current.l_child != nil
			end
		end
		return nil
	end
	#recursive post order depth first search
	#* input: (target) integer to search binary tree for
	#* output: node containing target or empty array (nil)
	def rdf_search(target)
		current = @tree
		node = []
		return current if current.value == target
		rdf(target,current,node)
		node[0]
	end

	#recursive function for red_search
	#* input: (target) integer to search binary tree for
	#* input: (current) the current node to explore
	#* input: (node) store the location of target node if found
	private
	def rdf(target,current,node)
		return if current == nil
		return node << current if current.value == target
		rdf(target,current.l_child,node) 
		rdf(target,current.r_child,node)
	end
	public
	
	def to_s
		queue = []
		queue << @tree
		while !queue.empty?
			current = queue.shift
			puts "#{current.value}"
			queue << current.l_child if current.l_child != nil
			queue << current.r_child if current.r_child != nil
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

