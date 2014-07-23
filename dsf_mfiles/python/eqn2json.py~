# Takes the dsf_vars.csv file and converts it into a JSON file that our 
# web application can use. The JSON file populates the dropdown menus for the 
# series that get plotted.

import csv

output = '{\n'
with open('../csv/dsf_vars.csv', 'rb') as fin:
    reader = csv.reader(fin)
    for row in reader:
        output += ('\t"' + row[0] + '" : "' + row[1] + '",\n')
output = output[:-2]
output += '\n}';

fout = open('../var_list.json', 'w')
fout.write(output)

fin.close()
fout.close()
