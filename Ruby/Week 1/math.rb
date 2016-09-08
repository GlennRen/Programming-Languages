# times
5.times {
	puts "ruby"
}

# upto
0.upto(5) {
	|i| print i, " "
}

# downto
5.downto(0) {
	|i| print i, " "
}

#substring
string = "ruby is so cool!"
string = string[5..10]
puts string

# truncate
x = 2.3456
trun_x = (x*1000).floor/1000.00
puts x.floor
puts trun_x

# round
puts x.round(3)

# ceiling
puts 1.1.ceil

# floor
puts 1.9.floor

# even
def even(x)
	if x%2==0
		true 
	else
		false
	end
end
puts even 6

# odd
def odd(x)
	if x%2==1
		true
	else
		false
	end
end
puts odd 6

# gcd

# lcm

# e

# pi

# sqrt

# cbrt

# cos

# sin

# tan

# exp

# gamma

# hypot

# log