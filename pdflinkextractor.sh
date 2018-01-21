#!/bin/bash

# NAME:         pdflinkextractor
# AUTHOR:       Glutanimate (http://askubuntu.com/users/81372/) with changes made by Erik Johnson
# LICENSE:      GNU GPL v2
# DEPENDENCIES: wget lynx
# DESCRIPTION:  extracts PDF links from websites and dumps them to the stdout and as a textfile
#               only works for links pointing to files with the ".pdf" extension
#
# USAGE:        pdflinkextractor "www.website.com" output_dir

WEBSITE="$1"

echo "Getting linked list..."
echo "$1"
echo "$2"

lynx -cache=0 -dump -listonly "$WEBSITE" | grep ".*\.pdf$" | awk '{print $2}' | tee pdflinks.txt

# OPTIONAL

# DOWNLOAD PDF FILES

echo "Downloading..."    
wget -P "$2"/ -i pdflinks.txt
rm pdflinks.txt