(TeX-add-style-hook
 "diesix1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("standalone" "tikz" "border=3.14mm")))
   (TeX-run-style-hooks
    "latex2e"
    "standalone"
    "standalone10"
    "xparse"))
 :latex)

