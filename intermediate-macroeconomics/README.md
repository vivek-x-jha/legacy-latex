# Intermediate Macroeconomics Notes

- `src/intermediate-macroeconomics.tex`: primary LaTeX notes.
- `scans/`: 60-page handwritten packet scans plus per-page PNG/TXT OCR dumps and checksum.
- `build/`: compiled PDF + LaTeX auxiliary files.

Build with:
```
cd intermediate-macroeconomics
latexmk -pdf -output-directory=build src/intermediate-macroeconomics.tex
```
