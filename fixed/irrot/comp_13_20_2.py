#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# by Panos Mavrogiorgos, email: pmav99 <> gmail
 
from vtk import *
import math
import numpy as np
import os
import matplotlib
matplotlib.use('pgf')
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

from matplotlib import rc
import matplotlib.pyplot as plt
import matplotlib.path as path
import matplotlib.image as image
import matplotlib.cm as cm
import matplotlib.colors as colors
import matplotlib.lines as lines
from pylab import figure, axes, plot, xlabel, ylabel, title, grid, savefig, show
# The source file

def IDLIST2(i,j):
	ret=vtkIdList()
	ret.SetNumberOfIds(2)
	ret.SetId(0,i)
	ret.SetId(1,j)
	return ret

def NEXTID(k):
	if k==0:
		return 1
	elif k==1:
		return 3
	elif k==2:
		return 0
	elif k==3:
		return 2

file_name = "out_speed_13__2_20.vtu"
icomp=1
sign=-1
t=2.00000000000000088817841970013
# Read the source file.
reader = vtkXMLUnstructuredGridReader()
reader.SetFileName(file_name)
reader.Update()
output = reader.GetOutput()
Cell=output.GetPointData()
array=Cell.GetArray("speedy")
imax=array.GetNumberOfTuples()
jmax=array.GetNumberOfComponents()
c=np.zeros(imax)

points=output.GetPoints()
nbpoint=points.GetNumberOfPoints()
pos=np.zeros((nbpoint,2))


file_name2 = "out_pres_13_20.vtu"
reader2 = vtkXMLUnstructuredGridReader()
reader2.SetFileName(file_name2)
reader2.Update()
output2 = reader2.GetOutput()
Cell2=output2.GetCellData()
array2=Cell2.GetArray("Fluid")
imax2=array2.GetNumberOfTuples()


for i in range(0,nbpoint):
	for j in range(0,2):
		pos[i][j]=points.GetPoint(i)[j]
for i in range(0,imax):
	c[i]=abs(array.GetComponent(i,0)-2*t*pos[i][icomp]*sign)


cmap=cm.get_cmap('RdYlBu')
#norm=colors.Normalize()
#norm.autoscale(c)
x=pos[:,0]
y=pos[:,1]
fig = plt.figure(figsize=(6,6))
ax = fig.add_subplot(111)
scat=ax.scatter(x,y,c=c,cmap=cmap,marker='^',edgecolors='none')
cbar=fig.colorbar(scat)
cbar.set_label('$\Delta \unit{v_{y}}{\metre\per\second}$')

points2=output2.GetPoints()
nbpoint2=points2.GetNumberOfPoints()

b=[i for i in range(imax2) if array2.GetValue(i)==0]

b2=[]
for i in b:
	j=output2.GetCell(i).GetPointIds()
	for k in range(j.GetNumberOfIds()):
		b2.append((i,j.GetId(k),j.GetId(NEXTID(k))))

b3=[]
for i,j,k in b2:
	res=vtkIdList()
	output2.GetCellNeighbors(i,IDLIST2(j,k),res)
	for l in range(res.GetNumberOfIds()):
		if array2.GetValue(res.GetId(l))==1:
			b3.append((j,k))
			break

for i,j in b3:
	pos1=[]
	pos2=[]
	pos1=[output2.GetPoint(i)[0],output2.GetPoint(j)[0]]
	pos2=[output2.GetPoint(i)[1],output2.GetPoint(j)[1]]
	ax.add_line(lines.Line2D(pos1,pos2))

xlabel(r'$\unit{x}{\metre}$')
ylabel(r'$\unit{y}{\metre}$')
savefig('comp_13_20_2.pdf')
