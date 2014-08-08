# Takes the ca_vars.csv file and converts it into a JSON file that our 
# web application can use. The JSON file populates the dropdown menus for the 
# series that get plotted.

import csv

output = '{\n'
with open('../csv/ca_vars.txt', 'rb') as fin:
    reader = csv.reader(fin, delimiter='\t')
    for row in reader:
        output += ('\t"' + row[0] + '" : "' + row[1] + ' [' + row[2] + ']",\n')
output = output[:-2]
output += '\n}';

fout = open('../json/var_list.json', 'w')
fout.write(output)

fin.close()
fout.close()
