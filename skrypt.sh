if [ "$1" = "--date" ]; then
    date
    fi
    if [ "$1" = "--logs" ]; then
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
