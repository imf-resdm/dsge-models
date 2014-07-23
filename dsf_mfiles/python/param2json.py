# Takes the dsf_params.csv file and converts it into a JSON file that our 
# web application can use. The JSON file is used to fill in the parameters tab.

import csv

output = '{\n'
with open('../csv/dsf_params.txt', 'rb') as fin:
    reader = csv.reader(fin, delimiter='\t')
    for row in reader:
        output += ('\t"' + row[0].strip() + '": {\n')
        output += ('\t\t"latex": "' + row[1].strip() + '",\n')
        output += ('\t\t"val": "' + row[2].strip() + '",\n')
        output += ('\t\t"desc": "' + row[3].strip() + '",\n')
        output += ('\t\t"note": "' + row[5].strip() + '",\n')
        output += ('\t\t"equations": [' + row[4].strip() + ']\n')
        output += ('\t},\n')
output = output[:-2]
output += '\n}';

fout = open('../param_list.json', 'w')
fout.write(output)

fin.close()
fout.close()
