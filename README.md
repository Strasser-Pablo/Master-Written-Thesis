Master-Written-Thesis
=====================

This is the latex source of my bidisciplinary in mathematics and physics.

To compile a version with compiled figure:

	lualatex main.tex

To compile figure:

	lualatex --shell-escape main.tex
	make -f main.makefile
	lualatex --shell-escape main.tex
	lualatex --shell-escape main.tex
	make -f main.makefile
	lualatex --shell-escape main.tex


Some file are in compiled form in subdirectory with another file with a .py extension.
Executing the .py file create the .pdf file.
