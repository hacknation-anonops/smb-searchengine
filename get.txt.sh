
while read i 
	do
		/usr/bin/torify smbclient -N "$i" -c "get"
	done
