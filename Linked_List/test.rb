require "linked_list.rb"
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

#puts l.pop
puts l.tail.value
puts "---"

puts l.contains?('1')
puts l.contains?('3')
puts l.contains?('4')
puts "---"
puts l.find('1')
puts l.find('2')
puts l.find('3')

l.to_s

puts "---"

l.insert_at(5)
l.insert_at(2,'99')
l.to_s	
l.insert_at(5,'100')
l.to_s

puts "---"

l.remove_at(6)
l.to_s"