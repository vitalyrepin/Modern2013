L2H = latex2html
DVIPS = dvips
# Main input (w/o extension)
MAIN_FNAME=album
# Additional files the main input file depends on
ADDDEPS=paintings.tex arch.tex lockefreud.tex LighthouseMap.tex preamble.tex lifespans.tex mindmaps.tex PhilGuidelines.tex essays.tex freudbaudelaire.tex kant.tex

IMAGES = 1913_Gris_violin_and_guitar_anagoria.jpg 1914_Gris_Le_Petit_Dejeuner.jpg Camille_Pissarro_045.jpg Camille_Pissarro,_Gelee_blanche_(Hoarfrost),_1873.jpg \
	Cezanne_-_Mont_Sainte_Victoire_von_Lauves_aus_gesehen_2.jpg Cezanne_-_Selbstbildnis_mit_Mutze.jpg Constantin-Ernest-Adolphe-Hyacinthe_Guys_001.jpg\
	Courbet_Sleep.jpg Degas_-_Die_Buglerin.jpg Degas_-_Zwei_Tanzerinnen.jpg Delacroix_-_La_Mort_de_Sardanapale_(1827).jpg Edgar_Germain_Hilaire_Degas_012.jpg\
	Edgar_Germain_Hilaire_Degas_029.jpg Edgar_Germain_Hilaire_Degas_032.jpg Edgar_Germain_Hilaire_Degas_045.jpg Edgar_Germain_Hilaire_Degas_084.jpg\
	Edouard_Manet,_A_Bar_at_the_Folies-Bergere.jpg Edouard_Manet_-_Le_Chemin_de_fer_-_Google_Art_Project.jpg Edouard_Manet_-_Le_Dejeuner_sur_lherbe.jpg\
	Edouard_Manet_-_Olympia_-_Google_Art_Project_3.jpg Edouard_Manet_-_Segelboote_in_Argenteuil.jpg Eugene_Delacroix_-_Le_28_Juillet_La_Liberte_guidant_le_peuple.jpg\
	Eugene_Delacroix_-_Le_Massacre_de_Scio.jpg Gustave_Courbet_033.jpg Gustave_Courbet_040.jpg\
	Gustave_Courbet_-_A_Burial_at_Ornans_-_Google_Art_Project_2.jpg Gustave_Courbet_-_self_(1843).jpg Henri_de_Toulouse-Lautrec_009.jpg Henri_de_Toulouse-Lautrec_014.jpg\
	Henri_de_Toulouse-Lautrec_019.jpg MANET_-_Musica_en_las_Tullerias_(National_Gallery,_Londres,_1862).jpg Paul_Cezanne_109.jpg Howe_House.jpg Mies-van-der-Rohe-Haus_Berlin,_4.jpg\
	1300coopDetroit.jpg The_Mies_van_der_Rohe's_Pavilion.jpg Mies_van_der_rohe_3-6-2006.jpg Gehry_House_-_Image02.jpg Le_musee_Guggenheim_(Bilbao)_(3432848128).jpg\
	Architecture_buildings_Disney_concert_halls.jpg DiamondRanchHS_-_CarolHighsmith_-_4.jpg Eugene_Federal_Courthouse_(Lane_County,_Oregon_scenic_images)_(lanDA0003).jpg\
	Seattle_Central_Library,_Seattle,_Washington_-_20060418.jpg

IMAGES_WPATH=$(addprefix imgs/,$(IMAGES))
EPS_IMAGES=$(addprefix imgs/, $(addsuffix .eps, $(basename $(notdir $(IMAGES_WPATH)))))

# File names from Wikimedia are not that simple to process....
PAREN_O :=(
PAREN_C := )
EPS_IMAGES_RM=$(subst ',\',$(subst $(PAREN_C),\$(PAREN_C), $(subst $(PAREN_O),\$(PAREN_O), $(EPS_IMAGES))))

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"

RERUNBIB = "No file.*\.bbl|Citation.*undefined"

GOALS = $(MAIN_FNAME).pdf

RM = /bin/rm -f

all:            $(GOALS)

DEPS = 	$(MAIN_FNAME).tex $(ADDDEPS)

$(MAIN_FNAME).pdf: $(DEPS) $(IMAGES_WPATH) $(EPS_IMAGES)


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
# http://tex.stackexchange.com/questions/67859/errors-in-latexmk-with-use-of-auto-pst-pdf-and-hyperref
		latexmk -e "\$$hash_calc_ignore_pattern{'pdf'} = '^/(CreationDate|ModDate|ID) ';" -pdf -pdflatex="pdflatex --shell-escape  %O  %S" $<


clean:
		latexmk -c
		$(RM) *.bbl
		$(RM) $(EPS_IMAGES_RM)

