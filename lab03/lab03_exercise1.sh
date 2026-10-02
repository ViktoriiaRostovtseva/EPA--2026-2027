#!/bin/bash

# lab03_exercise1.sh
# The user passes a whole number. This script counts running processes
# and prints whether that count is higher than the number given.
#
# Usage: ./lab03_exercise1.sh <number>
# Example: ./lab03_exercise1.sh 15

# Stop if the user forgot the number.
if [ -z "$1" ]; then
	echo "Usage: $0 <number>"
	echo "Example: $0 15"
	exit 1
fi

# Allow only digits so a bad value does not crash the comparison.
case "$1" in
	*[!0-9]*)
		echo "Error: '$1' is not a whole number."
		echo "Usage: $0 <number>"
		exit 1
		;;
esac

# ps -ef lists processes. wc -l counts the lines. Store that count in ct.
ct=$(ps -ef | wc -l)
ct=$(echo "$ct" | tr -d '[:space:]')

# -gt means greater than.
if [ "$ct" -gt "$1" ]; then
	echo "Maximum number of processes exceeded"
else
	echo "The maximum number of processes NOT exceeded"
fi
