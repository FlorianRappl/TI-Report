# LaTeX Makefile
TEX = pdflatex
BIB = bibtex
FILE = report
TEMP = tireport
DEPENDENCIES = $(FILE).tex \
	$(TEMP).cls

all: $(FILE).pdf

$(FILE).pdf: $(DEPENDENCIES)
	$(TEX) $(FILE).tex
	$(BIB) $(FILE).aux
	$(TEX) $(FILE).tex
	$(TEX) $(FILE).tex

.PHONY: clean

clean:
	rm -f $(FILE).pdf *.aux *.blg *.out *.bbl *.log *.abstract
