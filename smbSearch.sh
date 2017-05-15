#!/bin/bash

for i in $(shuf smb); do

	echo $i #print ip

	smbclient -g -N -L "\\\\$i\\"  |grep Disk |tr -s ' ' |awk -F"|" '{print $2 }' > DISK_TEMP #get general info

	for o in $(cat DISK_TEMP) ; do

		smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i $o /g" | tr -s ' '  | tee -a file.list #get file lists

	done

done

rm -fv DISK_TEMP #cleaning

sh analysis.sh #doing a quick one

smbclient -N -g "\\\\$(cat out.file |awk '{print $1}' |tr -d 'IP=')\\$(cat out.file |awk '{print $2}' |tr -d 'SHARE=')" -c "get"
