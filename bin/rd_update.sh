#!/bin/sh
# simple script to fetch and verify bsd.rd ramdisk
# copyright (c) Faisal Saadatmand
# To do: introduce the following switches: check for changes (-u), mirror selection (-m), output dir (-o), install bsd.rd option (-i), and help (-h). Write manual

name="rd_update"
desc="A simple shell script to fetch and verify bsd.rd ramdisk"
version="0.1"
#mirror="$(cat /etc/installurl | egrep -v "^\s*(#|$)")"
mirror="https://fastly.cdn.openbsd.org/pub/OpenBSD"

download_ramdisk(){
	curl -O -# $mirror/snapshots/amd64/bsd.rd
}

download_sig1(){
	curl -O -# $mirror/snapshots/amd64/SHA256 
}

download_sig2(){
	curl -O -# $mirror/snapshots/amd64/SHA256.sig 
}

verify_curroption(){
	sha256 -C SHA256 bsd.rd
}

verify_signify(){
	signify -Cp /etc/signify/openbsd-63-base.pub -x SHA256.sig bsd.rd
}

print_checksum(){
	sha256 bsd.rd 
}

# execute script

if [ "$1" != "" ] && [ "$1" = "-u" ]; then
	
	echo "Downloading bsd.rd ramdisk kernel:"
	echo $(download_ramdisk)  

	echo "Downloading SHA256:" 
	echo $(download_sig1)
	
	echo "Downloading SHA256.sig:" 
	echo $(download_sig2)

	echo "Verifying for accidental curroption against SHA256:" 
	echo $(verify_curroption) 
	
	echo ""

	echo "Verifying cryptographically against SHA256.sig:"
	echo $(verify_signify)
	
	echo ""
	
	echo $(print_checksum)

else
    echo "Invalid input"
fi
