class LinkedList
	attr_accessor :head, :tail, :size
	def initialize 
		@head = nil
		@tail = @head
		@size = 0
	end

	def append(value = nil)
		node = Node.new(value)
		if @head == nil
			@head = node
			@tail = node
		else
			@tail.next_node = node
			@tail = node
		end
		@size += 1
	end

	def prepend(value = nil)
		node = Node.new(value)
		if @head == nil
			@head = node
			@tail = node
		else
			node.next_node = @head
			@head = node
		end
		@size += 1
	end

	def at(index)
		curr_node = @head
		curr_indx = 0
		begin
			if index > @size - 1 
				puts "Error: index out of bounds"
			else
				while curr_indx < index
					curr_node = curr_node.next_node
					curr_indx += 1
				end
			end
		rescue Exception=>e
			puts "Caught: #{e}"
			puts "check if the index value is an integer"
		end
		curr_node
	end

	def pop
		return tail if @size == 0
		curr_node = @head
		#point to second last node
		for i in 0...@size-2
			curr_node = curr_node.next_node
		end 
		@tail = curr_node
		curr_node = curr_node.next_node
		@tail.next_node = nil
		@size -= 1
		curr_node.value
	end

	def contains?(value)
		return true if @head.value == value
		return false if @size == 1
		i = 0
		matched = false
		curr_node = @head.next_node
		while !matched && i < @size - 2
			matched = true if curr_node.value == value
			curr_node = curr_node.next_node
			i += 1
		end
		matched
	end

	def find(value)
		return 0 if @head.value == value
		return @size-1 if @tail.value == value
		matched = false
		i = 0
		curr_node = @head.next_node
		while !matched  && i < @size - 2
			i += 1
			matched = true if curr_node.value == value
			curr_node = curr_node.next_node
		end
		i
	end


	def to_s
		curr_node = @head
		for i in 0..@size-1
			print "#{curr_node.value}->"
			curr_node = curr_node.next_node
		end
		print "nil\n"
	end

	def insert_at(index, value = nil)
		if index > @size
			puts "index out of bounds"
		else
			if index == 0
				prepend(value)
			elsif index == @size
				append(value)
			else
				curr_node = @head.next_node
				i = 1
				while i != index-1
					curr_node = curr_node.next_node
					i += 1
				end 
				node = Node.new(value)
				node.next_node = curr_node.next_node
				curr_node.next_node = node
				@size += 1
			end
		end
	end

	def remove_at(index)
		if index > @size-1
			puts "index out of bounds"
		else
			curr_node = @head
			if index == 0
				@head = @head.next_node
				curr_node.next_node = nil
				@size -= 1
			else

				i = 0
				while i < index-1
					curr_node = curr_node.next_node
					i += 1
				end
				node = curr_node.next_node
				curr_node.next_node = node.next_node
				node.next_node = nil
				@size -= 1
			end
		end
	end
	
	class Node
		attr_accessor :value, :next_node
		def initialize(value = nil)
			@value = value
			@next_node = nil
		end
	end

end


