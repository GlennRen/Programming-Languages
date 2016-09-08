numbers = File.open("../numbers.txt", "r").read.gsub! "\r\n", ","
print numbers