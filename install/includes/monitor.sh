if [ ! -f ~/.config/hypr/conf/monitor.conf ]; then
  # Установка начального разрешения экрана
  echo -e "${GREEN}"
  cat <<"EOF"
 _  _   __   _  _  _ __  ____  __  ____
( \/ ) /  \ / )( \/ )  )(_  _)/  \(  _ \
/ \/ \(  O )) __ (\    \  )( (  O )) __/
\_)(_/ \__/ \_)(_/(__(_/ (__) \__/(__)
EOF
echo -e "${NONE}"
  echo "Пожалуйста, выберите начальное разрешение экрана. Можно изменить позже в ~/.config/hypr/conf/monitor.conf"
  echo
  screenres=$(gum choose --height 15 "1024x768" "1280x720" "1280x800" "1440x900" "1280x1024" "1680x1050" "1280x1440" "1600x1200" "1920x1080" "1920x1200" "2560x1440" "2560x1600")
  SEARCH="monitor=,preferred,auto,auto"
  REPLACE="monitor=,$screenres,auto,1"
  sed -i -e "s/$SEARCH/$REPLACE/g" ~/hyprdots/$version/.config/hypr/conf/monitor.conf
  echo ":: Начальное разрешение экрана установлено на $screenres"
else
  rm ~/hyprdots/$version/.config/hypr/conf/monitor.conf
fi
