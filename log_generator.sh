# Скрипт под запуск на виндоус через git-bash

#!/usr/bin/env bash
mkdir -p opt/app

touch opt/app/log.txt

echo "Запуск записи в лог-файл каждые 17 секунд. Для остановки Ctrl+C."

while true; do
        RANDOM_STRING=$(echo "$(date +%s%N)${RANDOM}${RANDOM}" | md5sum | base64 | head -c $((RANDOM % 20 + 1)))
    if [ -z "$RANDOM_STRING" ]; then
        RANDOM_STRING="[empty]"
    fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] $RANDOM_STRING" >> /c/users/user/opt/app/log.txt
    sleep 17
done

# Для автозагрузки на Windows создаем .bat файл с коммандой:
# start "" "C:\Program Files\Git\git-bash.exe" -c "/c/users/user/opt/app/log_generator.sh"
