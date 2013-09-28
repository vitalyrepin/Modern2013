L2H = latex2html
DVIPS = dvips
# Main input (w/o extension)
MAIN_FNAME=album
# Additional files the main input file depends on
ADDDEPS=paintings.tex lockefreud.tex LighthouseMap.tex preamble.tex

IMAGES = Edouard_Manet_-_Le_Chemin_de_fer_-_Google_Art_Project.jpg Edouard_Manet_-_Olympia_-_Google_Art_Project_3.jpg Constantin-Ernest-Adolphe-Hyacinthe_Guys_001.jpg MANET_-_Musica_en_las_Tullerias_(National_Gallery,_Londres,_1862).jpg Delacroix_-_La_Mort_de_Sardanapale_(1827).jpg Eugene_Delacroix_-_Le_Massacre_de_Scio.jpg  Eugene_Delacroix_-_Le_28_Juillet_La_Liberte_guidant_le_peuple.jpg Gustave_Courbet_-_self_(1843).jpg Gustave_Courbet_040.jpg Courbet_Sleep.jpg Gustave_Courbet_-_A_Burial_at_Ornans_-_Google_Art_Project_2.jpg  Edouard_Manet_-_Segelboote_in_Argenteuil.jpg

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"

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

