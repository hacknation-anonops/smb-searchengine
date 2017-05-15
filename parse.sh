#!/bin/bash
python3 parse.py
cat out.file | rev | cut --complement -d' ' -f-7 | rev  | sed 's/\ /\\ /'   > out.final.file


#cat out.final.file | while read i; do echo "$(echo $i | cut -d: -f-2):$(echo "$i" | cut --complement -d':' -f-2 | sed 's/\ /\\ /g') "; done > download.txt

