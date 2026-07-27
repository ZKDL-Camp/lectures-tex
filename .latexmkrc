# Use pdflatex (overrides system default of lualatex)
$pdf_mode = 1;
$pdflatex = 'pdflatex -shell-escape %O %S';

# Fix bibtex bootstrap failure when no .aux exists yet:
# 1.5 means "run bibtex only when .bib is found AND (.bbl already exists
# OR .aux already contains \bibdata).  This prevents bibtex from running
# on the empty stub .aux that latexmk creates on the very first pass.
$bibtex_use = 1.5;
