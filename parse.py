for line in open("file.list", "r", encoding="utf-8"):
    line = line.split(" ", maxsplit=2)
    if line[2].startswith('\\'):
        print(line)
