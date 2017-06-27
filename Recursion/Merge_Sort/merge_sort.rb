#splits the unsorted array into subarrays until the subarrays contain one element
#* INPUT: unsorted array
#* OUTPUT: sorted array 
def merge_sort (unsorted)
	if unsorted.length == 1
		return unsorted
	end
	i_begin = 0
	i_end = unsorted.length - 1
	i_middle = i_end / 2
	left = unsorted[i_begin..i_middle]
	right = unsorted[i_middle+1..i_end]

	left = merge_sort(left)
	right = merge_sort(right)
	merge(left,right)

end
# sorts left and right halfs of an array in ascending order
# * INPUT: left and right halfs of an array
# * OUTPUT: merge left and right half of an array in ascending order
def merge (left, right)
	sorted = []
	#sort till one side is empty
	while !left.empty? && !right.empty? do
		if left[0] > right[0]
			sorted << right[0]
			right.shift
		else
			sorted << left[0]
			left.shift
		end
	end

	#add remaning elements
	while !left.empty?
		sorted << left[0]
		left.shift
	end

	while !right.empty?
		sorted << right[0]
		right.shift
	end
	sorted

end

a= [1,2,3,5,4,8]
a = merge_sort(a)
puts a



