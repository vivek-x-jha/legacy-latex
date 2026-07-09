# AGENTS.md

## Scope

Research-notes workspace for LaTeX transcriptions and study notes. Keep each subject's source, references, and build outputs separated.

## Entry Points

- Shared build wrapper: `bin/build.sh`
- Build orchestration: `Makefile`
- Real analysis source: `real-analysis/src/intro_real_analysis_rosenlicht.tex`
- Real analysis references: `real-analysis/refs/`
- Intermediate macroeconomics source: `intermediate-macroeconomics/src/intermediate-macroeconomics.tex`
- Other subject sources: `<subject>/src/`

## Build Commands

Build a subject with the wrapper:

```sh
./bin/build.sh real-analysis
./bin/build.sh intermediate-macroeconomics
```

Make shortcuts:

```sh
make build-real-analysis
make build-macro
make build-complex-analysis
make references
```

Direct examples:

```sh
latexmk -pdf -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
latexmk -c -output-directory=real-analysis/build real-analysis/src/geometric-pointwise-convergence.tex
latexmk -pdf -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
latexmk -c -output-directory=linear-algebra/build linear-algebra/src/midterm-questions.tex
latexmk -pdf -output-directory=complex-analysis/build complex-analysis/src/euler-theorem-notes.tex
latexmk -c -output-directory=complex-analysis/build complex-analysis/src/euler-theorem-notes.tex
```

## Verification Workflow

When comparing LaTeX output against a source PDF, run checks entirely in temporary space so no artifacts are left in the repository.

```sh
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
  -o /tmp/legacy-latex-output.txt real-analysis/build/intro_real_analysis_rosenlicht.pdf

gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=txtwrite \
  -o /tmp/legacy-latex-reference.txt "real-analysis/refs/Intro Real Analysis - Rosenlicht.pdf"
```

Compare sections with `rg`, `diff`, or other tooling against `/tmp/*.txt` files, then delete temporary files or let `/tmp` clean them up.

## Rules

- Do not copy comparison artifacts into the repository.
- Preserve PDFs in build directories unless the user explicitly asks to remove them.
- Keep reference assets under `refs/`; do not rewrite or move them without explicit approval.
- Keep LaTeX edits narrow and consistent with the surrounding source style.

## Memory

- Use `docs/known-issues.md` for recurring build/OCR/LaTeX issues and verified workarounds.
- Use `docs/agent-memory.md` for durable project facts that are likely to matter in future sessions.
