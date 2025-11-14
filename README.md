# Research Notes Workspace

Two parallel transcription projects live here. Each keeps LaTeX sources, build products, and reference material separated so the directories stay lean.

## intermediate-macroeconomics
- `src/` holds `intermediate-macroeconomics.tex`.
- `scans/` stores the raw 60-page scan (`*-scan.pdf`) plus the per-page PNG/TXT exports and checksum.
- `build/` contains the compiled PDF and LaTeX auxiliaries.

Build with:
```
cd intermediate-macroeconomics
latexmk -pdf -output-directory=build src/intermediate-macroeconomics.tex
```

## real-analysis
- `src/` contains `intro_real_analysis_rosenlicht.tex`.
- `references/` keeps OCR dumps (`rosenlicht-source.txt`, chapter excerpts, etc.).
- `build/` holds the generated PDF and auxiliary files.

Build with:
```
cd real-analysis
latexmk -pdf -output-directory=build src/intro_real_analysis_rosenlicht.tex
```

Use `latexmk -c` inside either project if you want to clean the build tree (the reference/scan folders are the long-term assets).
