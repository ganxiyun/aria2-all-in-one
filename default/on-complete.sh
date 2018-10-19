#!/bin/sh 

# TODO seems it does not support BT download
REAL_TEMP_DIR="`realpath ${TEMP_DIR}`"

if [ $2 -eq 1 ]; then
	cut_start=$((${#REAL_TEMP_DIR} + 1))

	MOVE_TO="/data`realpath "$3" | cut -c${cut_start}-`"
	MOVE_TO_PARENT="`dirname "${MOVE_TO}"`"

	mkdir -p "${MOVE_TO_PARENT}"

	mv "$3" "${MOVE_TO}"
fi

echo [$(date)] $2, $3, $1 "<br>" >> /data/_log.html
