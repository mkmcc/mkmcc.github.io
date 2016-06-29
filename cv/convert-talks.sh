#!/bin/bash
emacs --batch -q -f 'package-initialize' -l convert-talks.el --eval '(ct-parse-talks "../_data/talks.yml")'
