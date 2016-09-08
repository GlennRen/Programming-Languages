numbers = []

# Creates a new file from an array where every element is on a new line
# Params:
# +arr+:: array that will be outputted to file
# +filename+:: filename
def create_file(arr, filename)
	file = File.open(filename, "w")
	for number in arr
		file.puts(number)
	end
end

# Interate through each line of the file and store it in the array +numbers+
File.open("../numbers.txt", "r") do |f|
	f.each_line do |line|
		numbers << line.to_i
	end
end

# Sort +numbers+ from least to greatest & store result inside +ascend+
ascend = numbers.sort_by { |x| x }
# Sort +numbers+ from greatest to least & store result inside +descend+
descend = numbers.sort_by { |x| -x}
# Remove repeated numbers from +ascend+ & store result inside +uniq_ascend+
uniq_ascend = ascend.uniq

# Call +create_file+ function on new arrays
create_file(ascend, "ascending.txt")
create_file(descend, "descending.txt")
create_file(uniq_ascend, "nodups.txt")