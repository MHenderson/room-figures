PROJECT = room-figures
OUTDIR = ${BUILD_FOLDER}/Combinatorics/Room\ Squares/$(PROJECT)
PDF_OUTPUT = $(OUTDIR)/$(PROJECT).pdf
TEXFILE = src/$(PROJECT).tex

.PHONY: all pdf watch clean

all: pdf

pdf: $(PDF_OUTPUT)

$(PDF_OUTPUT): ${TEXFILE}
	latexmk -cd -outdir=$(OUTDIR) -xelatex $<;
	latexmk -c -cd -outdir=$(OUTDIR) -xelatex $<

watch: $(TEXFILE)
	latexmk -cd -outdir=$(OUTDIR) -pvc -xelatex $<
