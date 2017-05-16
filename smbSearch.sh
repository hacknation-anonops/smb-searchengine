#!/bin/bash

function parsing ()

{
	python3 parse.py #parse line in grepable output

	cat out.file | rev | cut --complement -d' ' -f-7 | rev  | sed 's/\ /\\ /'   > out.file #get output without additional info form smbclient

}

function download () #untested

{

	for line in $(shuf out.final.file); do

	        smbclient -N -g "\\\\$(echo $line |awk '{print $1}' |tr -d 'IP=')\\$(echo $line |awk '{print $2}' |tr -d 'SHARE=')\\$(echo $line |awk '{print $3}' |tr -d 'PATH=')" -c "get"

	done

}

function upload () #needs tweak

{

	smbclient -N -g "\\\\$IP\\$SHARE\\$PATH -c "put" #upload to share

}

#main program
for i in $(shuf ips); do #crawl the ip list

	echo $i #print ip

	smbclient -g -N -L "\\\\$i\\"  |grep Disk |tr -s ' ' |awk -F"|" '{print $2 }' > DISK_TEMP #get info about disks

	for o in $(cat DISK_TEMP) ; do #crawl the disk list

		smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i $o /g" | tr -s ' '  | tee -a file.list #get file list

	done

done

rm -fv DISK_TEMP #cleaning
parsing()
