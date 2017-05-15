wc -l *
echo -n exe:
grep "\.exe " file.list | wc -l
echo -n doc:
grep "\.doc" file.list | wc -l
echo -n xls:
grep "\.xls" file.list | wc -l
echo -n ppt:
grep "\.ppt" file.list | wc -l
echo -n html:
grep "\.html " file.list | wc -l
echo -n txt:
grep "\.txt " file.list | wc -l
echo -n bat:
grep "\.bat " file.list | wc -l
echo -n msi:
grep "\.msi " file.list | wc -l
echo -n pdf:
grep "\.pdf " file.list | wc -l
echo -n epub:
grep "\.epub " file.list | wc -l
echo -n reg:
grep "\.reg " file.list | wc -l
echo -n ini:
grep "\.ini " file.list | wc -l
echo -n php:
grep "\.php " file.list | wc -l
echo -n csv:
grep "\.csv " file.list | wc -l
echo -n pst:
grep "\.pst " file.list | wc -l
echo -n good hosts:
grep "Anonymous login successful" file.list |wc -l
