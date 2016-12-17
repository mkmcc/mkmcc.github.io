#!/bin/bash
emacs --batch -q -f 'package-initialize' -l convert-telescope.el --eval '(ct-parse-talks "../_data/grants.yml")'
