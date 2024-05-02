ТЗ 1
Программа находится в папке TZ1 и называется solution.sh
Программа получает на вход две директории - входную и выходную. Во входной директории есть различные файлы и другие директории, в которых могут лежать другие файлы
Программа выполняет копирование всех вложенных во входную директорию файлов в выходную директорию.
Программа учитывает повторение имен файлов - при попытке копирования программа проверяет, есть ли файл в выходной директории, и если есть, то добавляет суффикс к концу файла. Например, a_1.txt при наличии файла a.txt
Чтобы запустить программу нужно перейти в директорию TZ1 и выполнить в командной строке:
./solution.sh входная_директорая выходная_директория
Например:
./solution.sh /home/a/input_dir /home/a/output_dir
Необходимо указывать абсолютный путь до директории, "/" после названия директории ставить не нужно
Программа будет выводить в консоль некоторые шаги, которая она делает: вывод всех вложенных файлов, сообщение об успешном копировании
