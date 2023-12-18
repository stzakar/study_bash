#!/bin/bash -x
_rc="*.tar.gz"
_i=0
_lim=1

exectar ()
{
tar -xvf $_archive
rm $_archive
}


while [ "$_i" -le "$_lim" ]; 
do
        _archive=$(find -maxdepth 1 -name $_rc)
                if [ -z $_archive ]; then
                        _i=1
                        exit 0
                else
                        _i=0
                fi
        exectar

done



#!/bin/bash

extract_archives() {
    files=$(ls "$1")
    archives=$(echo "$files" | grep -E '\.tar$|\.gz$')

    if [ -z "$archives" ]; then
        echo "No files to extract."
        exit 0
    fi

    for archive in $archives; do
        file_path="$1/$archive"
        if [[ $archive == *.tar ]]; then
            tar -xf "$file_path" -C "$1"
            rm "$file_path"
            echo "File $archive extracted successfully."
        elif [[ $archive == *.gz ]]; then
            gzip -d "$file_path"
            echo "File $archive extracted successfully."
        fi
    done
    extract_archives "$1"
}