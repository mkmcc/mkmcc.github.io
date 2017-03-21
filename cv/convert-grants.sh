#!/bin/bash
emacs --batch -q -f 'package-initialize' -l convert-grants.el --eval '(ct-parse-talks "../_data/grants.yml")'
