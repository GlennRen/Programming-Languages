require 'markaby'

def getDirectories(path)
	Dir.chdir(path)
	directs = Dir.glob("*/")
	return directs
end

def getFiles(path)
	Dir.chdir(path)
	files = Dir.glob("*").reject do |i|
  		File.directory?(i)
	end
	return files
end

def gen_html(path, site_title, file_name)
	site = Markaby::Builder.new
	directs = getDirectories(path)
	files = getFiles(path)

	site.html do
		head do
			if site_title=="Projects"
				title "Home"
			else
				title site_title
			end
			link :rel => "stylesheet", :href => "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		end
		body do
			div.container do
				h2 path[12..path.length]
				path_split = path.split("/")
				back_path = path_split[path_split.length-2]
				if back_path=="glenn"
					button :type => "button", :class => "btn btn-default" do
						a :href => "#"  do 
							span :class => "glyphicon glyphicon-triangle-left"
						end
					end
				elsif back_path=="Projects"
					button :type => "button", :class => "btn btn-default" do
						a :href => "/home/glenn/Classes/Programming-Languages/Ruby/Week 3/Directory Sites/home.html"  do 
							span :class => "glyphicon glyphicon-triangle-left"
						end
					end
				else
					button :type => "button", :class => "btn btn-default" do
						a :href => "/home/glenn/Classes/Programming-Languages/Ruby/Week 3/Directory Sites/" + back_path + ".html"  do 
							span :class => "glyphicon glyphicon-triangle-left"
						end
					end
				end

				button :type => "button", :class => "btn btn-default" do
					a :href => "/home/glenn/Classes/Programming-Languages/Ruby/Week 3/Directory Sites/home.html" do 
						span :class => "glyphicon glyphicon-home"
					end
				end

				table.table do
					thead do
						tr do
							th "Name"
						end
					end
					tbody do						
						for direct in directs
							tr do
								td.dir do
									a :href => direct[0..direct.length-2]+".html" do	
										ul :style => "list-style-type: none" do
											li :style => "display: inline" do
												span :class => "glyphicon glyphicon-folder-close"
											end
											li :style => "display: inline" do
												" "+ direct[0..direct.length-2]
											end
										end
									end 
								end
								gen_html(path+direct, direct[0..direct.length-2], direct[0..direct.length-2]+".html")
							end
						end
						for file in files 
							tr do
								td.fil do
									ul :style => "list-style-type: none" do
										li :style => "display: inline" do
											file_type = file.split(".")[1]
											if  file_type=="json" || file_type=="js"
												img :src => "../icons/js.png", :style => "height: 20px"
											elsif file_type=="css"
												img :src => "../icons/css.png", :style => "height: 20px"
											elsif file_type=="gif"
												img :src => "../icons/gif.png", :style => "height: 20px"
											elsif file_type=="html"
												img :src => "../icons/html.png", :style => "height: 20px"
											elsif file_type=="jpg" || file_type=="jpeg"
												img :src => "../icons/jpg.png", :style => "height: 20px"
											elsif file_type=="md"
												img :src => "../icons/md.png", :style => "height: 20px"
											elsif file_type=="pdf"
												img :src => "../icons/pdf.png", :style => "height: 20px"
											elsif file_type=="png"
												img :src => "../icons/png.png", :style => "height: 20px"
											elsif file_type=="py"
												img :src => "../icons/python.png", :style => "height: 20px"
											end
										end
										li :style => "display: inline" do
											" " + file
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	Dir.chdir("/home/glenn/Classes/Programming-Languages/Ruby/Week 3/Directory Sites")
	file = File.open(file_name, "w")
	file.puts(site.to_s)
end

gen_html("/home/glenn/Projects/","Projects", "home.html")