import smb.SMBConnection

# for IP in open("ips"):
IP = "192.168.1.120"
host = smb.SMBConnection.SMBConnection("", "", "SOMEFUCK", IP)
host.connect(IP, port=445, timeout=80)
for SHARE in host.listShares(timeout=80):
    print(host.listPath(SHARE, "Musik"))