# argv[1] - file path to main folder (like $HOME/dsge-models)                  
# argv[2] - name of model (e.g. 'dsf' or 'nk' or 'ca')  

from scipy.io import loadmat
from sys import argv
from json import load

TT = 30 # how many periods of results to send

model = argv[2]
fpath = argv[1] + '/' + model + '_mfiles/'
json = ''

#### 1 - load model results

# load results from mat file and convert to numpy lists
#mat = loadmat(fpath + model + '_results.mat')

#endo_names = mat['M_']['endo_names'].tolist()[0][0]
#endo_simul = mat['oo_']['endo_simul'].tolist()[0][0]

# make string of JSON-looking data out of numpy lists
#for name, simul in zip(endo_names, endo_simul):
#    json += '"' + name.strip() + '":'
#    json += '[' + ','.join(['%2f' % jj for jj in simul[0:TT]]) + '],'

#### 2 - load extra plot vars

# load results from mat file and convert to numpy lists (new format though)
mat = loadmat(fpath + 'plot_vars.mat')
plot_names = mat['plot_vars'].dtype.names
plot_simul = mat['plot_vars'][0][0]
for name, simul in zip(plot_names, plot_simul):
    print 'name: ' + name
    json += '"' + name.strip() + '":'
    json += '[' + ','.join(['%2f' % jj for jj in simul[0:TT]]) + '],'

# write JSON-looking string to file
f = open(model + '_mfiles/' + model + '_results.json', 'w')
f.write('{' + json[:-1] + '}')
f.close()

# pull JSON data into python dict                                              
json_data = open(fpath + model + '_results.json')
data = load(json_data)
json_data.close()

# make string of public directory
pub_fpath = fpath[:fpath[:-1].rfind('/')] + '/public/'

# create csv file to write to
f = open(pub_fpath + model + '_results.csv','w')
for key in data.keys():
    f.write(str(key) + ', ' + str(data[key])[1:-1] + '\n')
f.close()
