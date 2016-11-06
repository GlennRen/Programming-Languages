import scala.io.Source

var nums = List[Int]()
val filename = "../numbers.txt"
for (line <- Source.fromFile(filename).getLines) {
  nums = line.toInt :: nums
}
nums = nums.sortWith(_<_)

var subNumList = List[List[Int]]()
for (i <- 0 to (nums.length - 1)) {
  var currentIndex = nums(i)
  if (i == 0) {
    subNumList = List(currentIndex) :: subNumList
  } else {
    val currentList = subNumList(subNumList.length-1)
    if (currentList(0) == currentIndex) {
      subNumList = subNumList.updated(subNumList.length-1, (currentList :+ currentIndex))
    } else {
      subNumList = subNumList :+ List(currentIndex)
    }
  }
}

subNumList = subNumList.sortWith(_.length > _.length)

for (i <- 0 to 4) {
  println (subNumList(i))
}
