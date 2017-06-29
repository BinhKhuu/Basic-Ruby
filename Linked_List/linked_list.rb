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
		match = matched?(value,1)
	end

	def find(value)
		return 0 if @head.value == value
		return @size-1 if @tail.value == value
		index = matched?(value,2)
		index

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
				curr_node = iterate(index-1)
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
				#iterate to the element that is before the target element to remove
				curr_node = iterate(index-1)
				node = curr_node.next_node
				curr_node.next_node = node.next_node
				node.next_node = nil
				@size -= 1
			end
		end
	end

	private 
	def iterate(index)
		iterator = @head
		for i in 0...index
			iterator = iterator.next_node
		end
		iterator
	end

	private
	def matched?(value,mode)
		i = 0
		match = false
		curr_node = @head.next_node
		while !match  && i < @size - 1
			i += 1
			match = true if curr_node.value == value
			curr_node = curr_node.next_node
		end
		i = nil unless match
		mode == 1 ? match : i
	end


	class Node
		attr_accessor :value, :next_node
		def initialize(value = nil)
			@value = value
			@next_node = nil
		end
	end

end


