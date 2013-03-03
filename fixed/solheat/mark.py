import csv

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
plt.figure(figsize=(1,1))
plot(0,0,'*')
plt.axis('off')
savefig('mark.pgf')
