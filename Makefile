BIB_BUILDER = bibtex
AUX_BUILDER = pdflatex
TARGET_BUILDER = pdflatex
TARGET = thesis.pdf
ALL_TEX = $(wildcard *.tex)
SOURCE = thesis.tex
AUX_FILE = $(basename $(SOURCE)).aux
BIBLIOGRAPHY = bibliography.bbl

$(TARGET): $(ALL_TEX) $(BIBLIOGRAPHY)
	@echo 'Building $(TARGET)'
	@$(TARGET_BUILDER) $(SOURCE)
	@echo 'All done.'

$(AUX_FILE): $(ALL_TEX)
	@echo 'Building AUX'
	@$(AUX_BUILDER) $(SOURCE)


$(BIBLIOGRAPHY): $(AUX_FILE)
	@echo 'Building bibliography'
	@$(BIB_BUILDER) $<


.PHONY: clean
clean:
	@rm -f $(TARGET)
	@rm -f *.log
	@rm -f *.aux
	@rm -f *.bbl
	@rm -f *.out
