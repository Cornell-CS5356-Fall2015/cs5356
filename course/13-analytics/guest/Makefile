$(eval LATEX_ENGINE=$(shell which pdflatex;echo $))

pdf:
	# tries to use found latex engine
ifdef LATEX_ENGINE
	cd presentation_latex/; $(LATEX_ENGINE) -synctex=1 -interaction=nonstopmode "presentation".tex
else
    $(info 'Could not find latex engine, please visit: https://latex-project.org/ftp.html')
endif
