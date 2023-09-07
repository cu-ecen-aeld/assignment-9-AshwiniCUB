#!/bin/bash
#Description: finder.sh shell script
#Author: Ashwini Patil
#Date  : 08/05/2023
#Reference: referred chatGPT to understand how to write the script

# path to a directory on the filesystem
filesdir="$1"   
# text string that need to search in files
searchstr="$2"

# Check if the script got exactly 2 arguments or not
if [ $# -ne 2 ]; then
    echo "ERROR: Invalid number of arguments"
    exit 1
fi

# Check if the specified directory exists or not
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory"
    exit 1
fi

# Count the number of matching lines in the directory and its subdirectories
matching_lines_count=$(grep -Rw ${filesdir} -e "${searchstr}" | wc -l)

# Print the final results
echo "The number of files are $(find "$filesdir" -type f | wc -l) and the number of matching lines are $matching_lines_count"

exit 0
