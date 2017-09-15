# Lists all of Cerner's Github repos and opens them as a web page -- cerner_2^5_2017
require 'json'
require 'net/http'
require 'uri'

uri=URI.parse("https://api.github.com/orgs/cerner/repos")
uri_org=URI.parse("https://api.github.com/orgs/cerner")
response = Net::HTTP.get_response(uri)
response_org = Net::HTTP.get_response(uri_org)
exit if (response.code != "200" || response_org.code != "200") #Don't try to go forward if you can't read the URLs
fileName="cerner_repos.html"
htmlFile = File.new(fileName,"w+")
htmlFile.puts "<HTML><TITLE>Cerner Github Repos</TITLE><BODY>"
parsed_json_org = JSON.parse(response_org.body)
htmlFile.puts "<h1><a href=\"#{parsed_json_org['blog']}\"><img src=\"#{parsed_json_org['avatar_url']}\" style=\"width:75px;height:75px;border:0;\" align=\"middle\"></a>Repositories sorted by Watchers</h1>"
parsed_json = JSON.parse(response.body).sort{|thing1,thing2| thing2['watchers'] <=> thing1['watchers']}
parsed_json.each do |json_string|
    htmlFile.puts "<p><a href=\"#{json_string['html_url']}\">#{json_string['name']}</a> -- <i>#{json_string['description']}</i></p>"
    htmlFile.puts "Watchers: #{json_string['watchers_count']} \t Forks: #{json_string['forks_count']} <hr align=\"left\" width=\"66%\">"
end
htmlFile.puts "</BODY></HTML>"
htmlFile.close()
# Write to file
if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
  system "start #{fileName}"
elsif RbConfig::CONFIG['host_os'] =~ /darwin/
  system "open #{fileName}"
elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
  system "xdg-open #{fileName}"
end
