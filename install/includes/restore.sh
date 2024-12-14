if [ -d ~/.config/hyprdots/settings ] ;then
    echo -e "${GREEN}"
    figlet "Восстановление настроек"
    echo -e "${NONE}"
    echo ":: Скрипт обнаружил существующую папку с настройками."
    if gum confirm "Хотите восстановить настройки?" ;then
        cp -r ~/.config/hyprdots/settings/. ~/hyprdots/$version/.config/hyprdots/settings/
    elif [ $? -eq 130 ]; then
        echo ":: Установка отменена"
        exit
    else
        echo ":: Восстановление пропущено"
    fi
fi
