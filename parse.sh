#!/bin/bash
python3 parser.py
cat out.file | rev | cut --complement -d' ' -f-7 | rev > out.final.file
