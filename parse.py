outfile = open("out.file", "w")
for line in open("file.list", "r", encoding="utf-8"):
    line = line.split(" ", maxsplit=2)
    if line[2].startswith('\\'):
        if line[2].endswith("\n"):
            line[2] = line[2].split("\n")[0]
        outfile.writelines("IP=" + str(line[0] + " " + "SHARE=" + str(line[1]) + " " + "PATH=" + str(line[2]) + "\n"))