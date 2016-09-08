numbers = []

File.open("../numbers.txt", "r") do |f|
	f.each_line do |line|
		numbers << line.to_i
	end
end

def sumArr(arr)
	sum = 0
	for number in arr
		sum = sum + number
	end
	return sum
end

def average(arr)
	sum = sumArr(arr)
	return (sum.to_f) / (arr.length)
end

def mode(arr)
	occurences = Hash.new
	for number in arr
		if occurences[number] == nil
			occurences[number] = 1
		else
			occurences[number] = occurences[number] + 1
		end
	end
	return occurences.max_by{|k,v| v}
end

def standard_deviation(arr)
	average = average(arr)
	differences = []
	for number in arr
		differences << (number - average)**2
	end
	return Math.sqrt(average(differences))
end

print ("Would you like some basic statistics about the array? ")
basic_stat_choice = gets.chomp.downcase

if basic_stat_choice=="y"
	print "Average/Mean: " + average(numbers).to_s
	print "\n"
	print "Mode: " + mode(numbers)[0].to_s
	print "\n"
	print "Standard Deviation: " + standard_deviation(numbers).to_s
	print "\n"
end

print ("Would you like some detailed info about each of the numbers? ")
detail_info_choice = gets.chomp

if detail_info_choice=="y"
	output = File.open("output.txt", "w")
	output.puts "FORMAT: orginal number, square, square root, cube, cube root"
	for number in numbers
		square = number**2
		square_root = '%.2f' % [(Math.sqrt(number) * 100).round / 100.0]
		cube = number**3
		cube_root = '%.2f' % [(Math.cbrt(number) * 100).round / 100.0]
		output.puts (number.to_s + ", " + square.to_s + ", " + square_root.to_s + ", " + cube.to_s + ", " + cube_root.to_s)
	end
end