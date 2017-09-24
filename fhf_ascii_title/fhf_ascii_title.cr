# Making a simple rest call in crystal-lang to print First Hand Foundation as ASCII Art
# Webiste: http://artii.herokuapp.com/
# cerner_2^5_2017
require "http/client"
class Requester
    def initialize(@value : String)
    end

    def output
        response = HTTP::Client.get("http://artii.herokuapp.com/make?text=" + @value.gsub(' ',"+"))
        if response.status_code == 200
            response.body.lines.each do |line|
                puts line
            end
        else
            puts "Server call failed with status: " + response.status_code.to_s
        end
    end
end

requester = Requester.new("First Hand Foundation")
requester.output 
