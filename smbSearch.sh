#!/bin/bash

function parsing ()

{
	python3 parse.py #parse line in grepable output

	cat out.file | rev | cut --complement -d' ' -f-7 | rev  | sed 's/\ /\\ /'   > out.file #get output without additional info form smbclient

}

function download () #needs tweak

{

	for line in $(shuf file.dl); do #crawl file.dl list

	        smbclient -N $file -c "get" #download from share

	done

}

function inject () #needs tweak

{

	for line in $(shuf file.dl); do #crawl file.dl list

	        smbclient -N $file -c "get" #download from share

	done
	
	#some inject here
	
	#upload some stuf here
	smbclient -N $file -c "put" #upload to share

}

case $1 in
	
	parse|parsing)
	
		echo "start parsing"
	
		parsing()
	;;

	upload)
	
		echo "start uploading"
	
		upload()
	
	;;
	
	download)
	
		echo "start downloading"
	
		download()
	
	;;	
	
	*)
		#main program
		for i in $(shuf ips); do #crawl the ip list

			echo $i #print ip

			smbclient -g -N -L "\\\\$i\\"  |grep Disk |tr -s ' ' |awk -F"|" '{print $2 }' > DISK_TEMP #get info about disks

			for o in $(cat DISK_TEMP) ; do #crawl the disk list

				smbclient -N -g "\\\\$i\\$o" -c "recurse;dir"  | sed "s/^/$i $o /g" | tr -s ' '  | tee -a file.list #get file list

			done

		done

		rm -fv DISK_TEMP #cleaning
	
		parsing() #autoparse
		
		sh analysis.sh #do some quick analysis.sh

esac
