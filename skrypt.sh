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

if [ $# -ne 1 ]; then
    echo "Usage: $0 --logs <number_of_files>"
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Number of files must be a positive integer"
    exit 1
fi

number_of_files=$1

for ((i=1; i<=$number_of_files; i++)); do
    filename="log$i.txt"
    touch $filename
    echo "File name: $filename" > $filename
    echo "Script name: $0" >> $filename
    echo "Creation date: $(date)" >> $filename
done
show_help() {
    echo "Pomoc:"
    echo "Użycie: skrypt.sh [OPCJE]"
    echo "Dostępne opcje:"
    echo "  --help       Wyświetla pomoc"
    echo "  -a, --option-a    Opcja A"
    echo "  -b, --option-b    Opcja B"
}
