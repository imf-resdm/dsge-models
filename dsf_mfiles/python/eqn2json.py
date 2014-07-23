# Takes the dsf_eqns.csv file and converts it into a JSON file that our 
# web application can use. The JSON file is used to fill in equations on the 
# parameters tab and the shocks tab.

import csv

output = '{\n'
with open('../csv/dsf_eqns.csv', 'rb') as fin:
    reader = csv.reader(fin)
    for row in reader:
        output += ('\t"' + row[0] + '" : "' + row[1] + '",\n')
output = output[:-2]
output += '\n}';

fout = open('../eqn_list.json', 'w')
fout.write(output)

fin.close()
fout.close()
