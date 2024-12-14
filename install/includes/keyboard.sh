if [ ! -f ~/.config/hypr/conf/input.conf ] ;then
    # Настройка раскладки клавиатуры
    echo -e "${GREEN}"
    figlet "Клавиатура"
    echo -e "${NONE}"
    echo "Выберите раскладку клавиатуры. Можно изменить позже в ~/.config/hypr/conf/input.conf"
    echo "Начните вводить = Поиск, ENTER = Подтвердить, CTRL-C = Отмена"
    echo
    keyboard_layout=$(localectl list-x11-keymap-layouts | gum filter --height 15 --placeholder "Найдите раскладку клавиатуры...")
    echo
    if [ -z $keyboard_layout ] ;then
        keyboard_layout="us"
    fi
    SEARCH="kb_layout = us"
    REPLACE="kb_layout = $keyboard_layout"
    sed -i -e "s/$SEARCH/$REPLACE/g" ~/hyprdots/$version/.config/hypr/conf/input.conf
    echo ":: Раскладка клавиатуры изменена на $keyboard_layout"
    echo
else
    rm ~/hyprdots/$version/.config/hypr/conf/input.conf
fi
