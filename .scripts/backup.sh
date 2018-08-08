#!/bin/bash

#Script to backup important files to exernal HD
#Takes a directory as parameter to back files up to

#define the files to be backed up
FILES_LOCATION=("/home/lucca/Documents/" "/home/lucca/Downloads/" "/home/lucca/Pictures/" "/home/lucca/Music/")

if test -z "$1";then
	echo "Inform the directory to back files up to."
	return
fi
HD=${1%/}
shift

#get size of all files to be backed up
TOTAL=0
for FOLDER in ${FILES_LOCATION[@]}
do
	read folder_size<<<$(du -c $FOLDER | awk 'END{print $1}')
	TOTAL=$((TOTAL+folder_size))
done

#read external HD size
read hd_space<<<$(df $HD | awk 'END{print $4}')

#if HD has enough space copy all the files to folder NAME
if test "$hd_space" -gt "$TOTAL"; then
	DATE=`date +%Y-%m-%d`
	tar -cpzPvf $HD/backup-$DATE.tar.gz "${FILES_LOCATION[@]}"
else
	echo "Not enough free space on disk, backup failed."
fi
