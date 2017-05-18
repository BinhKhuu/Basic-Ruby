def bubble_sort (unsorted_list)
	length = unsorted_list.length
	sorted = false
	sorted_list = []
	while not sorted do
		sorted = true
		for i in 0...length-1
			if unsorted_list[i] > unsorted_list[i+1]
				sorted = false
				temp = unsorted_list[i]
				unsorted_list[i] = unsorted_list[i+1]
				unsorted_list[i+1] = temp 
			end
		end
		length -=1

	end
	return unsorted_list


end

def bubble_sort_by (unsorted_list)
	length = unsorted_list.length
	sorted = false
	sorted_list = []
	while not sorted do
		sorted = true
		for i in 0...length-1
			value = yield(unsorted_list[i],unsorted_list[i+1])
			if value > 0
				sorted = false
				temp = unsorted_list[i]
				unsorted_list[i] = unsorted_list[i+1]
				unsorted_list[i+1] = temp 
			end

		end

	end


end






a = [9,6,7,3,1,6,8,4]
bubble_sort(a)
puts a
puts ""

b = ["hi","hello","hey"]
bubble_sort_by(b) do |left, right|
	left.length - right.length
end
puts b
