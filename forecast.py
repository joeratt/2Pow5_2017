#!/usr/bin/env python
# Reads the current weather from weather.gov's API and prints the forecast for any zip code (in the US)  -- uses Google's maps api to find the name and long/lat
# cerner_2^5_2017
import json
import requests #you have to install this via 'pipenv install requests'

input_zip = int(input("Enter a zip code: "))

url = "https://maps.googleapis.com/maps/api/geocode/json?address=%d" % input_zip
req_zip_loc = requests.get(url)

if req_zip_loc.status_code != 200:
    print("Failed to find zip %s" %input_zip)
    exit() #exit since we can't finish

location_values = json.loads(req_zip_loc.content)
loc_results = location_values['results'][0]
city_state = loc_results['formatted_address']
long_lat = loc_results['geometry']['location']

r = requests.get('https://api.weather.gov/points/%.2f,%.2f/forecast' %(long_lat['lat'],long_lat['lng']))
if r.status_code != 200:
    print("Failed to find the forecast for %s" % city_state)
    exit() #exit since we can't finish

values = json.loads(r.content)
degree_sign= u'\N{DEGREE SIGN}'

currentPeriod = values['properties']['periods'][0]
print "The forecast for %s: in %s" % (currentPeriod['name'] ,city_state)
print "The temperature is %s%s%s" % (currentPeriod['temperature'],degree_sign,currentPeriod['temperatureUnit'])
print "%s" % currentPeriod['detailedForecast']
