# Main input (w/o extension)
MAIN_FNAME=labels
# Additional files the main input file depends on
ADDDEPS=

IMAGES=

GOALS = $(MAIN_FNAME).dvi $(MAIN_FNAME).pdf
DVIFILES = $(MAIN_FNAME).dvi

COPY = if test -r $*.toc; then cp $*.toc $*.toc.bak; fi

main:           $(DVIFILES)

all:            $(GOALS)

DEPS = 	$(MAIN_FNAME).tex $(ADDDEPS)


$(MAIN_FNAME).dvi: $(DEPS) $(patsubst %.png,%.eps,$(IMAGES))
$(MAIN_FNAME).pdf: $(DEPS) $(IMAGES)


%.dvi:          %.tex
		latexmk $<

%.png:  %.dia
	dia -e $@ $<

%.png: %.pic
	pic2plot -T png $< > $@

%.ps: %.pic
	pic2plot -T ps $< > $@

%.eps: %.ps
	ps2eps $<

%.eps:  %.dia
	dia -e $@ $<

%.eps:  %.dot
	dot -Tps $< -o $@

%.pdf:  %.eps
	epstopdf $<

%.eps: %.png
	convert $< $@

%.pdf:          %.tex
		latexmk -pdf $<

clean:
		latexmk -c
		$(RM) -f *.bbl
#		aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
#		*.inx *.ps *.dvi *.pdf *.toc *.out *.lot *.lof *.eps *.fls *.fdb_latexmk

