#!/bin/bash

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
	date
fi

if [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    count=${2:-100}

    mkdir -p logx

    for ((i=1; i<=$count; i++)); do
        echo "File: log$i.txt" > logx/log$i.txt
        echo "Created by: $0" >> logx/log$i.txt
        echo "Date: $(date)" >> logx/log$i.txt
    done

    echo "Created $count files in the logx directory."
    exit 0
fi

if [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if [ $# -ne 1 ]; then
    echo "Usage: $0 --logs <number_of_files>"
    exit 1
fi

if ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "Error: Number of files must be a positive integer"
    exit 1
fi

number_of_files=$2

for ((i=1; i<=$number_of_files; i++)); do
    filename="log$i.txt"
    touch $filename
    echo "File name: $filename" > $filename
    echo "Script name: $0" >> $filename
    echo "Creation date: $(date)" >> $filename
done



if [ "$1" = "--help" ]; then
    echo "Usage: $0 [--init] [--error <number of files>] [--logs <number of files>]"
    echo ""
    echo "Options:"
    echo "  --init          Clone the repository and add its path to the PATH environment variable"
    echo "  --error, -e     Create error files with the specified number of files"
    echo "  --logs          Create log files with the specified number of files"
    exit 0
fi

if [ "$1" = "--init" ]; then
    git clone https://github.com/VovkDanny/DSW-Lab-4-Vovk/releases/tag/v1.0
    repo_dir="$(pwd)/repozytorium"
    echo "export PATH="$repo_dir:$PATH"" >> ~/.bashrc
    source ~/.bashrc 
    echo "Repozytorium zostało sklonowane i ścieżka została dodana do PATH."
    exit 0
fi

echo "Usage: $0 --init"

if [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    count=${2:-100}
    mkdir -p errorx
    for ((i=1; i<=$count; i++)); do
        echo "File: error$i.txt" > errorx/error$i.txt
        echo "Created by: $0" >> errorx/error$i.txt
        echo "Date: $(date)" >> errorx/error$i.txt
    done

    echo "Created $count files in the errorx directory."
    exit 0
fi
