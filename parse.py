for line in open("file.list", "r", encoding="utf-8"):
    line = line.split(" ")[2]
    if line.startswith('\\'):
        topdir = line
        print(topdir)
