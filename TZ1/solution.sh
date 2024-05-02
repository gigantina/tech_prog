#!/bin/bash
input_dir="$1"
output_dir="$2"
echo "Список файлов в $1:"
find "$input_dir" -maxdepth 1 -type f -exec basename {} \;
echo "Список директорий в $1:"
find "$input_dir" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;
echo "Список всех вложенных файлов:"
find "$input_dir" -type f -exec basename {} \;

# получаем список всех вложенных файлов
files=$(find "$input_dir" -type f)
echo "Копирование файлов:"
# перебираем файлы
for file in $files; do
    # получаем полное имя файла
    file_full=$(basename "$file")
    if [[ "$file_full" == *.* ]]; then
    # отделяем только название файла, без разширения
    file_name="${file_full%.*}"
    # отделяем расширение файла
    extension="${file_full##*.}"
    else
    # если файл без расширения, то просто оставляем переменную с расширением пустой
    file_name="$file_full"
    extension=""
    fi

    dir_path=$(dirname "$file")
    # стороим новый путь, учитывая, что расширение может быть пустым
    new_path="${output_dir}/${file_name}${extension:+.$extension}"
    # если файл в выходной папке уже есть, то начинаем прибавлять суффиксы
    if [[ -f "$new_path" ]]; then
    suffix=1
    # начинаем с единицы и добавляем единицу к суффиксу, пока путь еще существует
    while [[ -f "${output_dir}/${file_name}_${suffix}${extension:+.$extension}" ]]; do
        ((suffix++))
    done
    # в конце прибавляем последний суффикс
    new_path="${output_dir}/${file_name}_${suffix}${extension:+.$extension}"
fi
    # копирование файла в новый путь
    cp "$file" "$new_path"
    echo "Копирование файла ${file} завершено"
done
echo "Список всех файлов в $2:"
find "$output_dir" -type f -exec basename {} \;
