class BinarySearch
	def sort(arr)
		@sorted_arr = arr.sort_by{ |x| x}
	end

	def search(value, sorted_arr, from=0, to=nil)
		if to == nil
			to = sorted_arr.length-1
		end

		mid = (from+to)/2
		if value<sorted_arr[mid]
			search(value, sorted_arr, from, mid-1)
		elsif sorted_arr[mid]<value
			search(value, sorted_arr, mid+1, to)
		else
			return mid
		end
	end
end

numbers = []
File.open("../numbers.txt", "r") do |f|
	f.each_line do |line|
		numbers << line.to_i
	end
end

bin = BinarySearch.new()
numbers = bin.sort(numbers)
num_location = bin.search(877, numbers)
puts num_location