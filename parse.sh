#!/bin/sh
cat out.file |rev |cut --complement -d' ' -f-7 |rev  |sed 's/\ /\\ /' > out.file1
