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
		@tree
	end

	def bf_search(target)
		queue = []
		set = @tree
		queue << set
		
		while !queue.empty?
			current = queue.shift
			if current.value == target
				return current
			end
			#add left and right children to queue
			queue << current.l_child if current.l_child != nil
			queue << current.r_child if current.r_child != nil
		end
		current
	end

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
				#add the left and righ children
				stack << current.r_child if current.r_child != nil
				stack << current.l_child if current.l_child != nil
			end
		end
		current
	end
	def rdf_search(target)
		current = @tree
		node = []
		return current if current.value == target
		rdf(target,current,node)
		node[0]
	end

	private
	def rdf(target,current,node)
		#call left
		return if current == nil
		return node << current if current.value == target
		rdf(target,current.l_child,node) 
		#call right
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


