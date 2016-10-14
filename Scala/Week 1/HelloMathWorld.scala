object HelloMathWorld {
	def main(args: Array[String]) {
		// Initialize Random class
		val rand = scala.util.Random
		// Create list of random floats 0-10
		val randfloat = List(rand.nextFloat*10, rand.nextFloat*10, rand.nextFloat*10, rand.nextFloat*10, rand.nextFloat*10)
		println(randfloat)
		
		var total : Float = 0
		var min : Float = 10
		var max : Float = 0

		for (i <- randfloat) {
			total = total + i
			if (i<min) {
				min = i
			} else if (i>max) {
				max = i
			}
			println ("Random Float: " + i)
			// truncate
			println ("Truncate: " + (i-(i%0.01)))
			// round
			println ("Round:" + math.round(i))
			// ceil
			println ("Ceiling: " + math.ceil(i))
			// floor
			println ("Floor: " + math.floor(i))
			// square root
			println ("Square Root: " + math.sqrt(i))
			// cube root
			println ("Cube Root: " + math.pow(i, .333333))
			// cosine
			println ("Cosine: " + math.cos(i))
			// sin
			println ("Sin: " + math.sin(i))
			// tangent
			println ("Tangent: " + math.tan(i))
			// exp
			println ("e^"+i+": " + math.exp(i))
			// log 2
			println ("Log2: " + (math.log(i)/math.log(2)))
			// blank line
			println ("")
		}

		println ("Min: " + min)
		println ("Max: " + max)
		var mean : Float = total/5
		println ("Mean: " + mean)
		var randfloatS = randfloat.sorted
		println ("Median: " + randfloatS(2))

		var stdTotal : Float = 0
		// Standard Deviation
		for (i <- randfloat) {
			var diff = math.pow(i-mean, 2).asInstanceOf[Float]
			stdTotal = stdTotal + diff
		}
		println ("Standard Deviation: " + math.sqrt(stdTotal/5))
	}
}