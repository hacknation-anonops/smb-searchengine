wc -l *
echo -n exe:
grep "\.exe" file.list | wc -l
echo -n doc:
grep "\.doc" file.list | wc -l
echo -n xls:
grep "\.xls" file.list | wc -l
echo -n ppt:
grep "\.ppt" file.list | wc -l
echo -n html:
grep "\.html" file.list | wc -l
echo -n txt:
grep "txt" file.list | wc -l
echo -n bat:
grep "\.bat" file.list | wc -l
echo -n msi:
grep "\.msi" file.list | wc -l
echo -n pdf:
grep "\.pdf" file.list | wc -l
echo -n epub:
grep "\.epub" file.list | wc -l
echo -n reg:
grep "\.reg" file.list | wc -l
echo -n ini:
grep "\.ini" file.list | wc -l

