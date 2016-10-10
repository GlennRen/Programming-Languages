# binary.rb
=begin
TODO: 
	- Define class to do binary search of an array of numbers
		- Read numbers file
		- Sort it
		- Do binary search
		- Output results of the search
	- Define a class to create and mantain a binary tree
		- Read numbers file
		- Insert numbers into tree
		- Output first 10 numbers using pre-order, in-order and post-order traversal.	
=end

# class BinarySearch
# 	def initialize(arr, @target)
# 		@arr = arr
# 		@target = target
# 	end

# 	l = 0
# 	r = @arr.length
# 	def search_for()
# 		if l>r
# 			abort("You cannot search an empyty array.")		
# 		end
# 		m = (l+r)/2.floor
# 		if arr[m] < @target
# 			l = m+1
# 			search_for(n)
# 		elsif arr[m] > @target
# 			l = m-1
# 		elsif arr[m] == @target
# 			return m

arr = [1,3,4,5,6,10,21,32,44]
target = 5

def binary_search(arr, target)
	m = arr.length/2.floor
	if arr[m] < target
		l = m+1
		# puts arr[m..arr.length-1], target
		binary_search(arr[m..arr.length-1], target)
	elsif arr[m] > target
		l = m-1
		# puts arr[0..m-1], target
		binary_search(arr[0..m-1], target)
	elsif arr[m] == target
		return m
	end
end

puts binary_search(arr, target)