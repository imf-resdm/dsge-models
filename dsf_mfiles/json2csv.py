## take a JSON file of results and turn it into a CSV file

from json import load

# pull JSON data into python dict
json_data = open('dsf_results.json')
data = load(json_data)
json_data.close()

# create csv file to write to
f = open('../public/dsf_results.csv','w')
for key in data.keys():
    f.write(str(key) + ', ' + str(data[key])[1:-1] + '\n')    
f.close()


