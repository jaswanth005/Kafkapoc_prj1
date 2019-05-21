import json

with open('samplejson.json') as json_file:  
    data = json.load(json_file)
    for x in data:
    	print("%s: %s" % (x, data[x]))
   