#!/bin/bash

# lab03_exercise2.sh
# Same check as exercise 1, but the result is appended to a log file
# instead of being printed on the screen. Each line starts with the
# date and time.
#
# Usage: ./lab03_exercise2.sh <number>
# Example: ./lab03_exercise2.sh 15

LOG_FILE="process_log.txt"

if [ -z "$1" ]; then
	echo "Usage: $0 <number>"
	echo "Example: $0 15"
	exit 1
fi

case "$1" in
	*[!0-9]*)
		echo "Error: '$1' is not a whole number."
		echo "Usage: $0 <number>"
		exit 1
		;;
esac

ct=$(ps -ef | wc -l)
ct=$(echo "$ct" | tr -d '[:space:]')

# date prints the current date and time for the log line.
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# >> appends a line to the file. It does not wipe earlier lines.
if [ "$ct" -gt "$1" ]; then
	echo "$timestamp Maximum number of processes exceeded" >> "$LOG_FILE"
else
	echo "$timestamp The maximum number of processes NOT exceeded" >> "$LOG_FILE"
fi
