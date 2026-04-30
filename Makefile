.PHONY: help build-real-analysis build-macro build-complex-analysis references

ROSENLICHT_PDF ?= /Users/mubuntu/Library/CloudStorage/Dropbox/education/Mathematics/Intro\ Real\ Analysis\ -\ Rosenlicht.pdf
GS ?= gs

help:
	@echo "Targets:"
	@echo "  build-real-analysis   Build the Rosenlicht notes with bin/build.sh"
	@echo "  build-macro           Build the intermediate macro notes"
	@echo "  build-complex-analysis Build the complex analysis Euler notes"
	@echo "  references            Regenerate Rosenlicht OCR text via Ghostscript"

build-real-analysis:
	@./bin/build.sh real-analysis intro_real_analysis_rosenlicht.tex

build-macro:
	@./bin/build.sh intermediate-macroeconomics intermediate-macroeconomics.tex

build-complex-analysis:
	@./bin/build.sh complex-analysis euler-theorem-notes.tex

references: real-analysis/refs/rosenlicht-source.txt

real-analysis/refs/rosenlicht-source.txt:
	@mkdir -p real-analysis/refs .cache/fontconfig
	XDG_CACHE_HOME=$$(pwd)/.cache $(GS) -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite -o $@ $(ROSENLICHT_PDF)
