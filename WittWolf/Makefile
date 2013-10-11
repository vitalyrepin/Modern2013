# Main input (w/o extension)
MAIN_FNAME=WittWolf

RM = /bin/rm -f
GOALS = $(MAIN_FNAME).dvi $(MAIN_FNAME).pdf $(MAIN_FNAME).html

main: $(MAIN_FNAME).html

all: $(GOALS)


%.dvi:  %.tex
	latexmk $<

%.pdf:  %.tex
	latexmk -pdf $<

%.html: %.t2t
	txt2tags -t html $<

%.tex: %.t2t
	txt2tags -t tex $<


clean:
	latexmk -c $(MAIN_FNAME).fdb_latexmk
	$(RM) -f *.bbl *.tex
