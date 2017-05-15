export prefixa="/"
while read i
do 
	if [ $(echo $i | cut -f3 -d' ' | head -c1) = "/" ]  
		then export prefixa="$(echo $i|cut -f3 -d' ' | sed 's/\\/\\\/g')\/" 
	else 
		echo $i | sed "s/$(echo $i | cut -f3 -d' ')/$prefixa$(echo $i | cut -f3 -d' ')/"
       	fi
done
