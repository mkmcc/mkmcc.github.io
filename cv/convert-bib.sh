#!/bin/bash
emacs --batch -q -f 'package-initialize' -l convert-bib.el --eval '(parse-bib "../_data/my-papers.bib")'
