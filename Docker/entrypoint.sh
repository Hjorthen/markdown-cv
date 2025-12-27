#!/bin/bash
set -euo pipefail
STYLETEMPLATE=$1
FILE=$2

DATADIR="/data"

# Rename the template and file such that they are referenced in the mounted data dir
STYLETEMPLATE="$DATADIR/$STYLETEMPLATE"
FILE="$DATADIR/$FILE"

if [ ! -d $DATADIR ] ; then
	echo "$DATADIR is not a directory. You probably forgot to mount it."
	exit -1
fi

if [ ! -f $STYLETEMPLATE ] ; then
	echo "$STYLETEMPLATE was not a file"
	exit -1
fi	

if [ ! -f $FILE ] ; then
	echo "$FILE was not a file"
	exit -1
fi	

# Get the name of the markdown file, excluding path and .md
FILE_NAME=$(basename $2 .md)
echo "Converting $FILE_NAME"

pandoc --standalone --template $STYLETEMPLATE --from markdown --to context --variable papersize=A4 \
	--output $DATADIR/${FILE_NAME}.tex $FILE 

echo 'R' | mtxrun --path=$DATADIR --result=${FILE_NAME}.pdf --script context --batchmode ${FILE_NAME}.tex 

