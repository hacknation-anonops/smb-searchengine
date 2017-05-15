#!/bin/bash
#parser to build the file path

#set the default path
export prefixa="/"

while read i
do 
	#if the first character of column 3 in our line begins with / it is a directory path
	if [ $(echo $i | cut -f3 -d' ' | head -c1) = "/" ]  

		#write the new directory path to prefix a, attempt to escape backslashes
		then export prefixa="$(echo $i|cut -f3 -d' ' | sed 's/\\/\\\/g')\/" 
	#if the first character is not / we need to write the current path to the filename in col 3
	else 
		#pass the line to sed, sed matches col 3 for substitution, then should apply prefix a before col 3
		echo $i | sed "s/$(echo $i | cut -f3 -d' ')/$prefixa$(echo $i | cut -f3 -d' ')/"
       	fi
done
