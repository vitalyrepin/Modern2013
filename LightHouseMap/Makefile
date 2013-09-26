L2H = latex2html
DVIPS = dvips
# Main input (w/o extension)
MAIN_FNAME=LighthouseMap
# Additional files the main input file depends on
ADDDEPS=
IMAGES = 

RERUNBIB = "No file.*\.bbl|Citation.*undefined"

GOALS = $(MAIN_FNAME).pdf

RM = /bin/rm -f

all:            $(GOALS)

DEPS = 	$(MAIN_FNAME).tex $(ADDDEPS)

$(MAIN_FNAME).pdf: $(DEPS) $(IMAGES)


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

%.eps: %.jpg
	convert "$<" "$@"


%.pdf:          %.tex
		latexmk -pdf $<

clean:
		latexmk -c
		$(RM) -f *.bbl

