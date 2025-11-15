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
