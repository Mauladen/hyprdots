echo -e "${GREEN}"
figlet "Перезагрузка"
echo -e "${NONE}"
echo "Рекомендуется перезагрузка системы."
echo
if gum confirm "Хотите перезагрузить систему сейчас?" ;then
    gum spin --spinner dot --title "Перезагрузка..." -- sleep 3
    systemctl reboot
elif [ $? -eq 130 ]; then
    exit 130
else
    echo ":: Перезагрузка пропущена"
fi
