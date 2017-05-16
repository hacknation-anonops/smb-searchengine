#!/bin/bash
for line in $(shuf file.dl); do #crawl file.dl list

        smbclient -N $(shuf file.dl |awk -F"|@|@" '{print $1}') -c get $(shuf file.dl |awk -F"|@|@" '{print $2}') #download from share

done
