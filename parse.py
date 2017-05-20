import subprocess
outfile = open("out.file", "w") # output file

for line in open("file.list", "r", encoding="utf-8"): # input file
    line = line.split(" ", maxsplit=2)

    if line[2].endswith("\n"):
        line[2] = line[2].split("\n")[0]

    if line[2].startswith('\\'):
        while line[2].startswith("\\"):
            line[2].replace("\\", "")
        topline = line[2]


    elif line[2].startswith("."):
        pass

    elif line[2] == "":
        pass

    elif not line[2].startswith("\\"):
        try:
            line[2] = str(topline) + "\\" + str(line[2])
            outfile.writelines(
                    '\\\\\\\\' + str(line[0] + "\\\\" + str(line[1]) + '\\\\|@|@' + str(line[2]) + '\n')) # writes lines to file
        except NameError:
            pass
    else:
        pass

bashCommand = "sh parse.sh"
process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()

for line in open("out.file1", "r"):
    line.replace
    outfile.writelines(line + "\n")