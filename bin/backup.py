from sys import argv
from subprocess import run

def main():        
    cmd = "rsync"
    switches = "-avX"
    options = "--delete"
    excludes = "--exclude-from=/home/faisal/.rsync_exclude"
    source = "/home/faisal/"
    dest = "faisal@tjury:/volume1/backups/x1carbon"
    if len(argv) != 2:
        print("Usage: " + argv[0] + " <frequency: -d, w, or m>")
        return -1
    arg = argv[1]
    if arg == "-d":
        dest += "/daily"
    elif arg == "-w":
        dest += "/weekly"
    elif arg == "-m":
        dest += "/monthly/$(date +%Y%m%d)"
    else:
        print("unknown argument")
        return -1
    run([cmd, switches, options, excludes, source, dest])

main()
