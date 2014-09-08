#!/usr/bin/env python
# Python Generate Large Data

import numpy as np
import string
import random
import csv
from itertools import izip_longest

# the function 
def genbig(times,nr,filename):
	with open('/home/baobao/Dropbox/stat662/stat662bigdata/Python/test3.csv','a') as f:
		writer = csv.writer(f,delimiter=',')


nr = 10
def cum(nr): # function to sample the numericals
	r = np.random.choice([0.1,0.2,0.3],nr,replace=True)
	return r.tolist()
vfunc = np.vectorize(cum,otypes=[list])
dat = vfunc(np.repeat(nr, 97)).tolist() # generate columns 1-97
dat.append(np.random.choice([-1,0,1],nr,replace=True).tolist()) # generate column 98
dat.append(np.random.choice(list(string.ascii_lowercase),nr,replace=True).tolist()) # generate column 99
def mstring(size=6, chars=string.ascii_uppercase + string.digits): # generate column 100
	return ''.join(random.choice(chars) for _ in range(size))
vfunc2 = np.vectorize(mstring,otypes=[list])
dat.append(vfunc2(np.random.randint(1, 11,size=nr)).tolist())
data = list(izip_longest(*dat, fillvalue=''))
with open('/home/baobao/Dropbox/stat662/stat662bigdata/Python/test3.csv','a') as f:
	writer = csv.writer(f,delimiter=',')
	write.writerows()
	writer.writerows(data)