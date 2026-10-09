
#!/bin/bash

usage() {
	echo "Usage: lab04_cpu_count.sh [MAX_NUM_CORES]"
	exit 1
}
if [ $# -lt 1 ]; then
	usage
fi

num_cpu=$(grep -c "^processor" /proc/cpuinfo)

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Not enough CPU cores!"
    exit 1
else
    echo "OK: Enough CPU cores."
fi

