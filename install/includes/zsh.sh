packages=(
  zsh
  starship
)

echo -e "${GREEN}"
cat <<"EOF"
  __   _  _       _  _  _  _     ____  ____  _  _
 /  \ / )( \ ___ ( \/ )( \/ )___(__  )/ ___)/ )( \
(  O )) __ ((___)/ \/ \ )  /(___)/ _/ \___ \) __ (
 \__/ \_)(_/     \_)(_/(__/     (____)(____/\_)(_/
EOF
echo -e "${NONE}"
echo
if gum confirm "Хотите настроить zsh?"; then
echo ":: Установка zsh!"
_installPackages "${packages[@]}";
echo ":: Установка oh-my-zsh!"
_installPackagesYay "oh-my-zsh-git";
echo ":: Установка zsh-autocomplete!"
sudo git clone https://github.com/marlonrichert/zsh-autocomplete.git  /usr/share/oh-my-zsh/plugins/zsh-autocomplete
echo ":: Установка zsh-autosuggestions!"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/plugins/zsh-autosuggestions
echo ":: Установка zsh-syntax-highlighting!"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/oh-my-zsh/plugins/zsh-syntax-highlighting
echo ":: Установка fast-syntax-highlighting!"
sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git /usr/share/oh-my-zsh/plugins/fast-syntax-highlighting
echo ":: Устанавливаем zsh по умолчанию"
chsh -s $(which zsh)
elif [ $? -eq 130 ]; then
  exit 130
else
  echo ":: Настройка zsh пропущена"
fi
