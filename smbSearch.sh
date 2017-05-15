#!/bin/bash  #you know what this is
for i in $(shuf smb); do
<<<<<<< HEAD
	torify smbclient -g -N -L "\\\\$i\\"  | grep Disk | tr -s ' ' | sed 's/^ //g' | cut -f1 -d' ' > DISK_TEMP

for o in $(cat DISK_TEMP) ; do
	torify smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i:$o /g" | tr -s ' '  | tee -a file.list
=======
	echo $i		#print ip
	proxychains smbclient -g -N -L "\\\\$i\\"  | grep Disk | tr -s ' ' | sed 's/^ //g' | cut -f1 -d' ' > DISK_TEMP #get basic infos

for o in $(cat DISK_TEMP) ; do
	proxychains smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i:$o /g" | tr -s ' '  | tee -a file.list #get file grepable output
>>>>>>> 36e3b4fc6ad3bc17c84ad984a7ee7d8155bea7a8
done
done
rm -fv DISK_TEMP #cleaning
