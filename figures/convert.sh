#!/bin/bash

infile=$1
outfile=${infile%.*}.png

gs -r72 -dGraphicsAlphaBits=4 -dTextAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pngalpha -sOutputFile=$outfile $infile
