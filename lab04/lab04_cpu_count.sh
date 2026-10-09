
#!/bin/bash

num_cpu=$(grep -c "^processor" /proc/cpuinfo)

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Not enough CPU cores!"
    exit 1
else
    echo "OK: Enough CPU cores."
fi

