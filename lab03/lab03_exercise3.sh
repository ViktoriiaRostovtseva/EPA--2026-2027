#!/bin/bash

# lab03_exercise3.sh
# Same process check as before. Choose screen (Exercise 1) or file
# (Exercise 2).
#
# Usage:
#   ./lab03_exercise3.sh <number> screen
#   ./lab03_exercise3.sh <number> file
#   ./lab03_exercise3.sh <number>          (the script then asks)

LOG_FILE="process_log.txt"

if [ -z "$1" ]; then
	echo "Usage: $0 <number> [screen|file]"
	echo "Example: $0 15 screen"
	exit 1
fi

case "$1" in
	*[!0-9]*)
		echo "Error: '$1' is not a whole number."
		echo "Usage: $0 <number> [screen|file]"
		exit 1
		;;
esac

# $2 is the optional choice: screen or file.
choice="$2"
if [ -z "$choice" ]; then
	echo "Select where to write the result:"
	echo "  1) Screen"
	echo "  2) File"
	read -r -p "Enter 1 or 2: " choice
fi

case "$choice" in
	1|screen|Screen|SCREEN)
		output="screen"
		;;
	2|file|File|FILE)
		output="file"
		;;
	*)
		echo "Error: choose screen (1) or file (2)."
		exit 1
		;;
esac

ct=$(ps -ef | wc -l)
ct=$(echo "$ct" | tr -d '[:space:]')

if [ "$ct" -gt "$1" ]; then
	message="Maximum number of processes exceeded"
else
	message="The maximum number of processes NOT exceeded"
fi

if [ "$output" = "screen" ]; then
	echo "$message"
else
	timestamp=$(date '+%Y-%m-%d %H:%M:%S')
	echo "$timestamp $message" >> "$LOG_FILE"
fi
