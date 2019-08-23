project=tapsse

all:
	pdflatex $(project)
#	dvipdf $(project).dvi

full:
	pdflatex $(project)
	bibtex $(project)
	pdflatex $(project)
#	latex $(project)
#	latex $(project)
#	dvipdf $(project)

read:
	@if [ $(shell uname) =  Darwin ]; then	open -a Skim $(project).pdf ; else evince $(project).pdf ; fi							

clean:
	rm -fr *.bbl *.log *.out *.aux *.blg *.xcp *.dvi

