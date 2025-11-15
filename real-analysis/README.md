# Intro Real Analysis

Project layout:

- `src/intro_real_analysis_rosenlicht.tex`: main LaTeX source.
- `build/`: compiled PDF plus LaTeX auxiliary files (run `latexmk -pdf -output-directory=build src/intro_real_analysis_rosenlicht.tex`).
- `refs/`: OCR/text extractions from Rosenlicht used during transcription (e.g., `rosenlicht-source.txt`, subsection snippets).

Keep `refs/` around for context, but feel free to `latexmk -c -output-directory=build` when you want a clean build tree.

## Table of Contents

Links point to canonical references when available (Wikipedia preferred; e.g. Grokking Aggregators/Grokking threads if more appropriate). When no clean reference exists we list the title without a hyperlink.

1. [Notions from Set Theory](https://en.wikipedia.org/wiki/Set_theory)
   - [Sets and Elements. Subsets](https://en.wikipedia.org/wiki/Set_(mathematics))
   - [Operations on Sets](https://en.wikipedia.org/wiki/Set_algebra)
   - [Functions](https://en.wikipedia.org/wiki/Function_(mathematics))
   - [Finite and Infinite Sets](https://en.wikipedia.org/wiki/Finite_set)
2. [The Real Number System](https://en.wikipedia.org/wiki/Real_number)
   - [The Field Properties](https://en.wikipedia.org/wiki/Field_(mathematics))
   - Order (no single encyclopedic entry covers Rosenlicht’s treatment succinctly)
   - The Least Upper Bound Property
   - The Existence of Square Roots
3. Metric Spaces
4. Continuous Functions
5. Differentiation
6. Integration
7. Infinite Series
8. Functions of Several Variables

(Chapters beyond II are placeholders mirroring Rosenlicht’s textbook order; hyperlinks can be filled as we transcribe those sections.)
