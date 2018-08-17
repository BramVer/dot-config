#!/bin/bash
# Setting a return status for a function
	FILE = basename($2)

	sed -n 1,"$1"p "$2" > "3" | subl3 "$4"/"$3" ;B
ASEDIR="$1"
IFS=$'\n'
cd $BASEDIR
 for f in $(find . -type f -name ' *')
 do 
	DIR=$(dirname "$f")
	DIR=${DIR:1}
	cd $BASEDIR$DIR
    rename 's/^ *//' *
 done