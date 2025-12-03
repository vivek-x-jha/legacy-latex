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

# Verification Workflow

When you need to compare sections of the LaTeX output against the source PDF, run the checks entirely in temporary space so no artifacts are left in the repository.

1. **Convert the latest build output to text**  
   ```sh
   gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
      -o /tmp/legacy-latex-output.txt real-analysis/build/intro_real_analysis_rosenlicht.pdf
   ```

2. **Convert the reference PDF to text**  
   ```sh
   gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
      -o /tmp/legacy-latex-reference.txt "real-analysis/refs/Intro Real Analysis - Rosenlicht.pdf"
   ```

3. **Compare sections**  
   Use `rg`, `diff`, or any other tooling against the `/tmp/*.txt` files. Delete the temporary files (or let `/tmp` clean them up); never copy them into the repo.

Feel free to adjust the output filenames under `/tmp`, but keep them outside the workspace so the git tree stays clean.
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
