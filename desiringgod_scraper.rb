require 'nokogiri'
require 'open-uri'
require 'csv'
 
url = "http://www.desiringgod.org/messages/all"
# Parse the page with Nokogiri
page = Nokogiri::HTML(open(url))

#Scrape the max number of pages and store in max_page variable
pagnum = page.css("nav.pagination span.last a").to_s[/\d+/]
#max_page = pagnum.gsub(/\D/, '').to_i
puts pagnum

title = []

pagnum.to_i.times do |i|

	url = "http://www.desiringgod.org/messages/all?page=#{i+1}"
	page = Nokogiri::HTML(open(url))

	# Store data in arrays
	page.css('div h2.title').each do |line|
		title << line.text.strip
	end
	puts title
	
end


#Write data to CSV file
#CSV.open("airbnb_listings.csv", "w") do |file|
#file << ["Listing Name", "Price", "Room Type", "Review","Number of Reviews"]
#	name.length.times do |i|
#		file << [name[i], price[i], details[i][0], details[i][1], details[i][2]]
#	end
#end