backup_files=(
  ".config/foot"
  ".config/dunst"
  ".config/hypr"
  ".config/hyprdots"
  ".config/rofi"
  ".config/waybar"
  ".config/wlogout"
  ".zshrc"
)

echo -e "${GREEN}"
cat <<"EOF"
 ____  ____  ____  ____  ____  ____  _  _   __   ____    __ _  __   ____  _ __
(  _ \(  __)( __ \(  __)(  _ \(  _ \/ )( \ / _\ / _  )  (  / )/  \ /    \/ )  )
 ) __/ ) _)  (__ ( ) _)  ) __/ ) _ () __ (/    \\    \   )  ((  O )) /\ (\    \
(__)  (____)(____/(____)(__)  (____/\_)(_/\_/\_/(_/__/  (__\_)\__/ \_)(_/(__(_/
EOF
echo -e "${NONE}"
echo "Скрипт может создать резервную копию ваших существующих конфигураций в .config и вашего .zshrc"
if gum confirm "Хотите создать резервную копию сейчас"; then

  # Создаем папку hyprdots
  if [ ! -d ~/hyprdots ]; then
    mkdir ~/hyprdots
  fi

  # Получаем текущую метку времени
  datets=$(date '+%Y%m%d%H%M%S')

  # Создаем папку для архива
  if [ ! -d ~/hyprdots/archive ]; then
    mkdir ~/hyprdots/archive
  fi

  # Создаем папку для резервных копий
  if [ ! -d ~/hyprdots/backup ]; then
    mkdir ~/hyprdots/backup
  else
    mkdir ~/hyprdots/archive/$datets
    cp -r ~/hyprdots/backup/. ~/hyprdots/archive/$datets/
  fi

  for df in "${backup_files[@]}"; do
    if [ -d ~/$df ]; then
      echo ":: Резервное копирование $df"
      mkdir -p ~/hyprdots/backup/$df
      cp -r ~/$df ~/hyprdots/backup/$df
    fi
    if [ -f ~/$df ] && [ ! -L "${df}" ]; then
      echo ":: Резервное копирование $df"
      cp ~/$df ~/hyprdots/backup/$df
    fi
  done

elif [ $? -eq 130 ]; then
  echo ":: Установка отменена"
  exit 130
else
  echo ":: Резервное копирование пропущено"
fi
