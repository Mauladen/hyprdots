echo -e "${GREEN}"
cat <<"EOF"
 ____  ____  ____  ____  ____   __   ____  ____  _  _  ____  __ _   __
/    \(  __)(  _ \(  __)( __ \ / _\ /  __)(  _ \( \/ )( __ \(  / ) / _\
) /\ ( ) _)  ) __/ ) _)  (__ (/    \) (    ) __/ )  /  (__ ( )  ( /    \
\_)(_/(____)(__)  (____)(____/\_/\_/\_/   (__)  (__/  (____/(__\_)\_/\_/
EOF
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
