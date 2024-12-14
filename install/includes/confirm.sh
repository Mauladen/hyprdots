echo -e "${GREEN}"
if [ -d ~/.config/hyprdots ]; then
  cat <<"EOF"
  __  ____  _  _   __  ____   __   ____  _  _  _ __  ____
 /  \(  __)/ )( \ /  \(  _ \ /  \ (  __)/ )( \/ )  )(  __)
(  O )) _ \) __ ((  O )) _ (/ /\ \ ) _) ) __ (\    \ ) _)
 \__/(____/\_)(_/ \__/(____/\_)(_/(____)\_)(_/(__(_/(____)
EOF
  echo
else
  cat <<"EOF"
 _  _  ___  ____  __   _  _   __  ____  __ _   __
( \/ )/ __)(_  _)/ _\ / )( \ /  \(  _ \(  / ) / _\
 )  /( (__   )( /    \) __ ((  O )) _ ( )  ( /    \
(__/  \___) (__)\_/\_/\_)(_/ \__/(____/(__\_)\_/\_/
EOF
  echo
fi
echo -e "${NONE}"
echo "Этот скрипт установит конфигурацию Hyprdots."
echo
if gum confirm "ХОТИТЕ НАЧАТЬ СЕЙЧАС?"; then
  echo
  echo ":: Установка Hyprland и необходимых пакетов"
  echo
elif [ $? -eq 130 ]; then
  echo ":: Установка отменена"
  exit 130
else
  echo
  echo ":: Установка отменена"
  exit
fi
