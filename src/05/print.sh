#!/bin/bash

START=`date +%s%N`
total_folders=$(du "$1" 2> /dev/null | wc -l)
top5=$(du -h $1 2> /dev/null | sort -hr | head -n 5 | awk '{print NR" - "$2", "$1"}')
total_files=$(find $1 -type f 2> /dev/null | wc -l)
conf_files=$(find $1 -name '*.conf' 2> /dev/null | wc -l)
text_files=$(find $1 -name '*.txt' 2> /dev/null | wc -l)
exec_files=$(find $1 -executable 2> /dev/null | wc -l)
log_files=$(find $1 -name '*.log' 2> /dev/null | wc -l)
archive_files=$(find $1 -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz" 2> /dev/null | wc -l)
symlink_files=$(find -L $1 -xtype l | wc -l)
top10_files=$(find $1 -type f -exec du -Sh {} + 2> /dev/null | sort -rh | head | awk '{if(index($2,".") == 0){type=""} else{type=$2; while(index(type, ".")!=0) {type=substr(type, index($2, ".")+1)}}}{print NR" - "$2", "$1", "type}')
top10exec_files=$(find $1 -type f -exec du -h {} + 2> /dev/null | sort -rh | head | awk '{printf("%d %s %s ", NR, $2, $1); system("md5sum " $2)}' | awk '{print $1" - "$2", "$3", "$4}')

echo "Total number of folders (including all nested ones) = $total_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top5"
echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $text_files"
echo "Executable files = $exec_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symlink_files"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top10_files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$top10exec_files"
END=`date +%s%N`
RUN_TIME=$((END-START))
echo "$RUN_TIME" | awk '{printf "Script execution time (in seconds) = %.2f\n", $1/1000000000}'
