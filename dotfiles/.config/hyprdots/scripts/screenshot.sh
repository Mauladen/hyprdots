#!/bin/bash

selection=$(printf "Весь экран\nВыделенная область\nАктивный монитор" | rofi -dmenu -i -p "Создание скриншота" -theme ~/.config/rofi/screenshot.rasi)

generate_filename() {
    local dir="$HOME/Изображения"
    mkdir -p "$dir"
    echo "$dir/screenshot_$(date +%Y%m%d_%H%M%S).png"
}

send_notification() {
    local file_path="$1"
    notify-send "📸 Скриншот сохранен: " "$file_path" \
        --icon="$file_path" \
        --hint=int:transient:1
}

case "$selection" in
    "Весь экран")
        file_path=$(generate_filename)
        grim "$file_path"
        swappy -f "$file_path" -o "$file_path"
        ;;
    "Выделенная область")
        file_path=$(generate_filename)
        grim -g "$(slurp)" "$file_path"
        swappy -f "$file_path" -o "$file_path"
        ;;
    "Активный монитор")
        active_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | "\(.x),\(.y) \(.width)x\(.height)"')
        if [ -n "$active_monitor" ]; then
            file_path=$(generate_filename)
            grim -g "$active_monitor" "$file_path"
            swappy -f "$file_path" -o "$file_path"
        else
            notify-send "Не найден активный монитор"
            exit 1
        fi
        ;;
    *)
        exit 1
        ;;
esac

if [ -n "$file_path" ]; then
    send_notification "$file_path"
fi
