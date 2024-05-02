#!/bin/bash
input_dir="$1"
output_dir="$2"
echo "Список файлов в $1:"
find "$input_dir" -maxdepth 1 -type f -exec basename {} \;
echo "Список директорий в $1:"
find "$input_dir" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;
echo "Список всех вложенных файлов:"
find "$input_dir" -type f -exec basename {} \;

files=$(find "$input_dir" -type f)
echo "Копирование файлов:"
for file in $files; do
    file_full=$(basename "$file")
    file_name="${file_full%.*}"
    extension="${file_full##*.}"

    dir_path=$(dirname "$file")
    last_folder=$(basename "$dir_path")
    new_path="${output_dir}/${file_name}.${extension}"
    if [ -f "$new_path" ]; then
        new_path="${output_dir}/${file_name}_from_${last_folder}.${extension}"
fi
    cp "$file" "$new_path"
    echo "Копирование ${file} завершено"
done
echo "Список всех файлов в $2:"
find "$output_dir" -type f -exec basename {} \;
