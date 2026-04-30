# Build Commands

## Real Analysis: Geometric Series Proof

Build `real-analysis/src/geometric-pointwise-convergence.tex` into `real-analysis/build/`:
```sh
latexmk -pdf -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

Clean auxiliary files:
```sh
latexmk -c -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

Build and clean in one line:
```sh
latexmk -pdf -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex \
  && latexmk -c -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
```

## Linear Algebra Midterm: Questions Only

Source: `linear-algebra/src/midterm-questions.tex`.

Build:
```sh
latexmk -pdf -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
```

Clean auxiliary files:
```sh
latexmk -c -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
```

## Complex Analysis: Euler Notes

Source: `complex-analysis/src/euler-theorem-notes.tex`.

Build with make:
```sh
make build-complex-analysis
```

Build directly:
```sh
latexmk -pdf -output-directory=complex-analysis/build complex-analysis/src/euler-theorem-notes.tex
```

Clean auxiliary files:
```sh
latexmk -c -output-directory=complex-analysis/build complex-analysis/src/euler-theorem-notes.tex
```

# Verification Workflow

When comparing LaTeX output against a source PDF, run checks entirely in temporary space so no artifacts are left in the repository.

1. Convert the latest build output to text:
   ```sh
   gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
      -o /tmp/legacy-latex-output.txt real-analysis/build/intro_real_analysis_rosenlicht.pdf
   ```

2. Convert the reference PDF to text:
   ```sh
   gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
      -o /tmp/legacy-latex-reference.txt "real-analysis/refs/Intro Real Analysis - Rosenlicht.pdf"
   ```

3. Compare sections with `rg`, `diff`, or other tooling against the `/tmp/*.txt` files.

Delete temporary files, or let `/tmp` clean them up. Do not copy comparison artifacts into the repository.
