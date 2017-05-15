outfile = open("out.file", "w")

for line in open("file.list", "r", encoding="utf-8"):
    line = line.split(" ", maxsplit=2)

    if line[2].endswith("\n"):
        line[2] = line[2].split("\n")[0]

    if line[2].startswith('\\'):
        topline = line[2]

    elif line[2].startswith("."):
        pass

    elif line[2] == "":
        pass

    elif not line[2].startswith("\\"):
        try:
            line[2] = str(topline) + "\\" + str(line[2])
        except NameError:
            pass
    else:
        pass
    outfile.writelines("IP=" + str(line[0] + " " + "SHARE=" + str(line[1]) + " " + "PATH=" + str(line[2]) + "\n"))