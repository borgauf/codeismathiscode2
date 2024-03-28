(TeX-add-style-hook
 "tikzprac2"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "inputenc"
    "tikz"
    "pgfplots")
   (TeX-add-symbols
    "dx"
    "ann"))
 :latex)

