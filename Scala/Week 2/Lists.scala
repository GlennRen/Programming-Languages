import scala.io.Source
val numbers = Source.fromFile("../numbers.txt").getLines.toList.sortWith(_<_)
println (numbers)