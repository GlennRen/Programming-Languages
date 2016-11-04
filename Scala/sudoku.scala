val board = Array.ofDim[Int](9,9)

print("-----------------------")
println()
for (i <- 0 until 9; j <- 0 until 9) {
	var value = s"${board(i)(j)}"
	if (s"${board(i)(j)}" == "0") {
		value = "?"
	}
	if ((i==3 && j==0) || (i==6 && j==0)){
		print("-----------------------")
		println()
	}

	if (j==3 || j==6) {
		print("| |" + value)
	} else if (j==8) {
		println("|" + value + "|")
	} else {
		print("|" + value)
	}
}
print("-----------------------")
println()