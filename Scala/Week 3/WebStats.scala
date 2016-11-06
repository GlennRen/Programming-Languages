import scala.xml.XML
import scala.io.Source
import scala.util.matching.Regex

def countInstances (string:String, sub:String) : Int = {
  var count = 0
  var idx = 0

  while (string.indexOf(sub, idx) != -1) {
    idx = string.indexOf(sub, idx) + 1
    count = count + 1
  }
  return count
}

def findStats (url:String) {
  val website = Source.fromURL(url).mkString
  // val websiteXML = XML.loadString(website)

  // Retrive Title
  val titleStart = website.indexOf("<title>") + 7
  val titleEnd = website.indexOf("</title>", titleStart)
  val title = website.substring(titleStart, titleEnd).filter(_>=' ')

  // Find the # of instances of the <html>, <a>, and <script> tags
  val htmlCount = countInstances(website, "<htm")
  val aCount = countInstances(website, "<a")
  val scriptCount = countInstances(website, "<script")

  val ulListCount = countInstances(website, "<ul")
  val olListCount = countInstances(website, "<ol")
  val totalListCount = ulListCount + olListCount

  val stylesCount = countInstances(website, """<link rel="stylesheet"""")
  val divCount = countInstances(website, "<div")
  val imgCount = countInstances(website, "<img")

  // Use regex to strip out all the tags in the website string
  val percContent = (website.replaceAll("<[^>]*>", "").length)/(website.length.toFloat)

  // Extract all the tags
  var tags = List[String]()
  val pattern = "<([^\\s>/]+)".r
  val matches = pattern.findAllIn(website)
  while (matches.hasNext) {
    var tag = matches.next
    if (!(tag contains "!")) {
      tag = tag.substring(1, tag.length)
      tags = tag :: tags
    }
  }

  val tagMap = tags.groupBy(identity).mapValues(_.size).toSeq.sortWith(_._2 > _._2)

  println("Title: " + title)
  println("URL: " + url)
  println("# of <html> tags: " + htmlCount)
  println("# of <a> tags: " + aCount)
  println("# of <script> tags: " + scriptCount)
  println("% of content versus HTM: tags: " + percContent)
  println("# of lists: " + totalListCount)
  println("# of <div> tags: " + divCount)
  println("# of ordered lists: " + olListCount)
  println("# of unordered lists: " + ulListCount)
  println("# of images: " + imgCount)
  println("# of stylesheets: " + stylesCount)
  println("The 5 most common tags were: ")

  for (i <- 1 to 5) {
    val highTag = tagMap(i)._1
    val tagOccur = tagMap(i)._2
    println(s"$i. <$highTag> with $tagOccur occurences")
  }

  println("-------------------------------------------------------------")
}

val stfrdURL = "http://csb.stanford.edu/class/public/pages/sykes_webdesign/05_simple.html"
val pvilleURL = "http://www.montgomeryschoolsmd.org/schools/poolesvillehs/"
val cnnURL = "http://www.cnn.com"

findStats(stfrdURL)
findStats(pvilleURL)
findStats(cnnURL)
