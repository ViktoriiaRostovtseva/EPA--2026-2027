
#!/bin/bash

usage() {
	echo "Usage: lab04_cpu_count.sh [MAX_NUM_CORES]"
	exit 1
}
if [ $# -lt 1 ]; then
	usage
fi

required_cores=$1

# Check that the argument is a positive integer
if ! [[ "$required_cores" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Please provide a positive integer."
    exit 1
fi

# Count available CPU cores

num_cpu=$(nproc)
echo "Available CPU cores: $num_cpu"
echo "Required CPU cores: $required_cores"
if [ "$num_cpu" -lt "$required_cores" ]; then
    echo "Error: Not enough CPU cores!"
    exit 1
else
    echo "OK: Enough CPU cores."
fi

# Command 1: read

read -r -p "Would you like to see the CPU check result again? (yes/no): " answer

# Command 2: case

case "$answer" in
    yes|y|YES|Y)
        echo "CPU check: $num_cpu available, $required_cores required."
        ;;
    no|n|NO|N)
        echo "You chose not to display the CPU check again."
        ;;
    *)
        echo "Unrecognized answer. Please enter yes or no."
        ;;
esac

echo
echo "About the Bash commands used:"
echo "1. read: accepts input from the user."
echo "   It makes the script interactive."
echo "2. case: selects an action based on the user's answer."
echo "   It handles different answers clearly."
echo "The script also validates the required CPU count before comparing it."

