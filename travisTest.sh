#!/usr/bin/env bash

echo "Changing into the desired folder"
cd $1

echo "Removing pdf if present"
[ -f $2.pdf ] && rm $2.pdf || echo "No PDF found -> continue without remove"

echo "Test if pdf is removed, fail if still present"
[ -f $2.pdf ] && exit 1 || echo "No PDF found -> continue building pdf output"

echo "Building pdf from source"
pdflatex $2.tex

echo "Exit successfully if pdf is present or with error if not present"
[ -f $2.pdf ] && exit 0 || exit 1
