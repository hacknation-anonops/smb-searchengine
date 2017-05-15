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

echo -n zip: ; grep "\.zip" file.list | wc -l
echo -n rar: ; grep "\.rar" file.list | wc -l
echo -n xz: ; grep "\.xz" file.list | wc -l
echo -n gz: ; grep "\.gz" file.list | wc -l
echo -n tar: ; grep "\.tar" file.list | wc -l
echo -n tgz: ; grep "\.tgz" file.list | wc -l
echo -n key: ; grep "\.key" file.list | wc -l
echo -n cfg: ; grep "\.cfg" file.list | wc -l
echo -n pst: ; grep "\.pst" file.list | wc -l
echo -n dat: ; grep "\.dat" file.list | wc -l
echo -n mbox: ; grep "\.mbox" file.list | wc -l
echo -n pptx: ; grep "\.pptx" file.list | wc -l
echo -n xlsx: ; grep "\.xlsx" file.list | wc -l
echo -n docx: ; grep "\.docx" file.list | wc -l
echo -n 7z: ; grep "\.7z" file.list | wc -l
echo -n pps: ; grep "\.pps" file.list | wc -l
