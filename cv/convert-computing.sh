#!/bin/bash
emacs --batch -q -f 'package-initialize' -l convert-computing.el --eval '(ct-parse-talks "../_data/grants.yml")'
