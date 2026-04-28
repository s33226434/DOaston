#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Ошибка: укажите адрес для проверки, например: $0 http://app.local"
    exit 1
fi

URL="$1"

echo "Проверяю доступность: $URL"
if curl -k -f -s -o /dev/null --max-time 5 "$URL"; then
    echo "✅ Ресурс доступен."
    exit 0
else
    echo "❌ Ресурс НЕ доступен."
    exit 1
fi
