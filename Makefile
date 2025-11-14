.PHONY: help build-real-analysis build-macro references

ROSENLICHT_PDF ?= /Users/mubuntu/Library/CloudStorage/Dropbox/education/Mathematics/Intro\ Real\ Analysis\ -\ Rosenlicht.pdf
GS ?= gs

help:
	@echo "Targets:"
	@echo "  build-real-analysis   Build the Rosenlicht notes with bin/build.sh"
	@echo "  build-macro           Build the intermediate macro notes"
	@echo "  references            Regenerate Rosenlicht OCR text via Ghostscript"

build-real-analysis:
	@./bin/build.sh real-analysis intro_real_analysis_rosenlicht.tex

build-macro:
	@./bin/build.sh intermediate-macroeconomics intermediate-macroeconomics.tex

references: real-analysis/refs/rosenlicht-source.txt

real-analysis/refs/rosenlicht-source.txt:
	@mkdir -p real-analysis/refs .cache/fontconfig
	XDG_CACHE_HOME=$$(pwd)/.cache $(GS) -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite -o $@ $(ROSENLICHT_PDF)
