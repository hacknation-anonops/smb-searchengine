
for line in $(shuf out.txt)
	do
		smbclient -N $line -c "get"
	done
