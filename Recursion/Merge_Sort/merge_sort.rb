#unsorted has items to sort, sorted is the array we work with
def merge_sort (unsorted)
	#base case single element is sorted
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

def merge (left, right)
	sorted = []
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



