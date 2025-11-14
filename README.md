# Research Notes Workspace

Two parallel transcription projects live here. Each keeps LaTeX sources, build products, and reference material separated so the directories stay lean.

## intermediate-macroeconomics
- `src/` holds `intermediate-macroeconomics.tex`.
- `refs/` stores the raw 60-page scan (`*-scan.pdf`) plus the per-page PNG/TXT exports, checksum, and other outlines.
- `build/` contains the compiled PDF and LaTeX auxiliaries.

Build with:
```
./bin/build.sh intermediate-macroeconomics
```

## real-analysis
- `src/` contains `intro_real_analysis_rosenlicht.tex`.
- `refs/` keeps OCR dumps (`rosenlicht-source.txt`, chapter excerpts, etc.).
- `build/` holds the generated PDF and auxiliary files.

Build with:
```
./bin/build.sh real-analysis
```

Use `latexmk -c` inside either project if you want to clean the build tree (the `refs/` folders are the long-term assets).

### Shortcuts
- `bin/build.sh <project> [main.tex]` wraps `latexmk -pdf -output-directory=build` and assumes there is a single `.tex` entry point inside `project/src/`.
- `make build-real-analysis` / `make build-macro` call the script for you.
- `make references` regenerates `real-analysis/refs/rosenlicht-source.txt` from the Dropbox PDF (configurable via the `ROSENLICHT_PDF` Makefile variable).
