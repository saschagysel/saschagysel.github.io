require "json"
require "rest-client"
require "time"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

station = "Wallisellen, Neugut"
count = 5

response = RestClient.get "http://transport.opendata.ch/v1/stationboard?station=#{station}&limit=#{count}"
abfahrten = JSON.parse(response)
# => repos is an `Array` of `Hashes`.

puts ""
puts "NÄCHSTE ABFAHRTEN"
puts "================="
puts ""
#puts "Aktuelle Zeit: #{Time.now}"
#puts ""

time_now = Time.now

abfahrten["stationboard"].each do |abfahrt|
 abfahrtszeit = Time.parse(abfahrt["stop"]["departure"])
 time_diff = (abfahrtszeit - time_now)/60
 to = abfahrt["to"]
 puts "#{time_diff.to_i} - #{to}"
end


#repos.each do |abfahrt|
#  title = repo[:title]
#  url = repo[:url]
#  votes = repo[:score]

#end
