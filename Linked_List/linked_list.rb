class LinkedList
	attr_accessor :head, :tail, :size
	def initialize 
		@head = nil
		@tail = @head
		@size = 0
	end

	def append(value=nil)
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

	def prepend(value=nil)
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
		curr_node.value
	end

	def contains?(value)
		return true if @head.value == value
		return false if @size == 1
		i = 0
		matched = false
		curr_node = @head.next_node
		while !matched && i < @size - 1
			matched = true if curr_node.value == value
			curr_node = curr_node.next_node
			i += 1
		end
		matched
	end

	def find

	end

	def to_s

	end


	class Node
		attr_accessor :value, :next_node
		def initialize(value=nil)
			@value = value
			@next_node = nil
		end

		def next

		end
	end
end

l = LinkedList.new
l.append('1')
l.append('2')
l.append('3')

puts l.head.value
puts l.head.next_node.value
puts l.head.next_node.next_node.value

puts "---"

l.prepend('new 1')

puts l.head.value
puts l.head.next_node.value
puts l.size
puts l.at(3)
puts "---"

puts l.pop
puts l.tail.value
puts "---"

puts l.contains?('1')
puts l.contains?('3')
puts l.contains?('4')
