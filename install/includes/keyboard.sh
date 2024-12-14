if [ ! -f ~/.config/hypr/conf/input.conf ]; then
  # Настройка раскладки клавиатуры
  echo -e "${GREEN}"
  cat <<"EOF"
 __ _   __    __   ____  _ __   __  ____  _  _  ____   __
(  / ) /  \  / _\ (  _ \/ )  ) / _\(_  _)( \/ )(  _ \ / _\
 )  ( / /\ \/    \ ) _ (\    \/    \ )(   )  /  ) __//    \
(__\_)\_)(_/\_/\_/(____/(__(_/\_/\_/(__) (__/  (__)  \_/\_/
EOF
  echo -e "${NONE}"
  echo "Выберите раскладку клавиатуры. Можно изменить позже в ~/.config/hypr/conf/input.conf"
  echo "Начните вводить = Поиск, ENTER = Подтвердить, CTRL-C = Отмена"
  echo
  keyboard_layout=$(localectl list-x11-keymap-layouts | gum filter --height 15 --placeholder "Найдите раскладку клавиатуры...")
  echo
  if [ -z $keyboard_layout ]; then
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
