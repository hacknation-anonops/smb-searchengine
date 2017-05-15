#!/bin/bash
for i in $(shuf smb); do
	proxychains smbclient -g -N -L "\\\\$i\\"  | grep Disk | tr -s ' ' | sed 's/^ //g' | cut -f1 -d' ' > DISK_TEMP

for o in $(cat DISK_TEMP) ; do
	proxychains smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i:$o /g" | tr -s ' '  | tee -a file.list
done
done
