#!/bin/bash
for file in *.pdf; do
    pdftotext "$file" "`basename $file .pdf`.txt"
done
