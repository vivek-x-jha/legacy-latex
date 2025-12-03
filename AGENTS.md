# Geometric Series Proof — Build/Clean

To build `real-analysis/src/geometric-pointwise-convergence.tex` and drop the PDF in `real-analysis/build/`:
```sh
latexmk -pdf -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

To clean auxiliary files after building:
```sh
latexmk -c -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

If you prefer a single-line build+clean:
```sh
latexmk -pdf -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex \
  && latexmk -c -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

# Linear Algebra Midterm (questions only)

Source: `linear-algebra/src/midterm-questions.tex` (Questions 1–3; Problem 2 parts d–e correspond to page 3 of the original scan.)

To build:
```sh
latexmk -pdf -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
```

To clean aux files:
```sh
latexmk -c -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
```
