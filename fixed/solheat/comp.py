
import os
import numpy as np
import matplotlib

matplotlib.use('pgf')
from pylab import figure, axes, plot, xlabel, ylabel, title, grid, savefig, show,semilogy
import matplotlib.pyplot as plt

pgf_with_custom_preamble = {
    "font.family": "serif", # use serif/main font for text elements
    "text.usetex": True,    # use inline math for ticks
    "pgf.rcfonts": False,   # don't setup fonts from rc parameters
    "pgf.preamble": [
         r'\input{'+os.getcwd()+r'/include.tex}'
         ],
    "pgf.texsystem": "lualatex"
}

matplotlib.rcParams.update(pgf_with_custom_preamble)

import csv

def readsol(filename,xsol,vsol):
	res = csv.reader(open(filename),delimiter=' ',skipinitialspace=True)
	res.next()
	res.next()
	res.next()
	res.next()
	res.next()
	res.next()

	for col in res:
		if len(col)==2:
			xsol.append(float(col[0]))
			vsol.append(float(col[1]))

def readexp(filename,xsol,vsol,dec):
	res = csv.reader(open(filename),delimiter=',')
	res.next()

	for col in res:
		if len(col)>=2:
			xsol.append(float(col[1])+dec)
			vsol.append(float(col[0]))

def getsol(vsol,x,esp):
	return vsol[int((x+esp*0.5)/esp)]

def compsol(xexp,vexp,vsol,esp,xmin,xmax,xout,vout):
	for i, x in enumerate(xexp):
		if x>=xmin and x<=xmax:
			xout.append(x)
			vout.append(abs(getsol(vsol,x,esp)-vexp[i]))

fig=figure()

l=[['sol_1.txt','data0_1.csv','ob','leg1'],['sol_100.txt','data0_100.csv','vb','leg3'],
		['sol_300.txt','data0_300.csv','*b','leg3'],['sol_500.txt','data0_500.csv','+b','leg3'],
		['sol_1.txt','data2_1.csv','og','leg1'],['sol_100.txt','data2_100.csv','vg','leg3'],
		['sol_300.txt','data2_300.csv','*g','leg3'],['sol_500.txt','data2_500.csv','+g','leg3'],
		['sol_1.txt','data4_1.csv','or','leg1'],
		['sol_100.txt','data4_100.csv','vr','leg3'],['sol_300.txt','data4_300.csv','*r','leg3'],['sol_500.txt','data4_500.csv','+r','leg3'],
		['sol_1.txt','data5_1.csv','oc','leg1'],
		['sol_100.txt','data5_100.csv','vc','leg3'],['sol_300.txt','data5_300.csv','*c','leg3'],['sol_500.txt','data5_500.csv','+c','leg3'],
		['sol_100.txt','data6_100.csv','vm','leg100'],
		['sol_300.txt','data6_300.csv','*m','leg300'],['sol_500.txt','data6_500.csv','+m','leg500']
		]


for fsol,fexp,st,leg in l:

	xsol=[]
	vsol=[]
	xexp=[]
	vexp=[]
	readsol(fsol,xsol,vsol)
	readexp(fexp,xexp,vexp,0.002)
	xout=[]
	vout=[]
	compsol(xexp,vexp,vsol,0.002,0,0.1,xout,vout)
	#plot(xsol,vsol,st,xexp,vexp,st,label=leg)
	semilogy(xout,vout,st,label=leg)
	ax = plt.subplot(111)
	ax.set_ylim(ymin=0.00001)



l=[['sol_1.txt','data8_1.csv','oy','leg1'],['sol_100.txt','data8_100.csv','vy','leg3'],
		['sol_300.txt','data8_300.csv','*y','leg3'],['sol_500.txt','data8_500.csv','+y','leg3'],
		['sol_1.txt','data9_1.csv','ok','leg1'],['sol_100.txt','data9_100.csv','vk','leg3'],
		['sol_300.txt','data9_300.csv','*k','leg3'],['sol_500.txt','data9_500.csv','+k','leg3'],
		]


for fsol,fexp,st,leg in l:

	xsol=[]
	vsol=[]
	xexp=[]
	vexp=[]
	readsol(fsol,xsol,vsol)
	readexp(fexp,xexp,vexp,0.01)
	xout=[]
	vout=[]
	compsol(xexp,vexp,vsol,0.002,0,0.1,xout,vout)
	#plot(xsol,vsol,st,xexp,vexp,st,label=leg)
	semilogy(xout,vout,st,label=leg)
	ax = plt.subplot(111)
	ax.set_ylim(ymin=0.00001)
#plot([0,0.1,0.2],[0,0.1,0.4],'ro')


xlabel(r'$\unit{x}{\metre}$')
ylabel(r'$\unit{|v_{exp}-v_{th}|}{\metre \per \second}$')
savefig('heatcomp.pdf')


fig=figure()

