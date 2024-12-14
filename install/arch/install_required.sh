# -----------------------------------------------------
# Установка необходимых пакетов
# -----------------------------------------------------

installer_packages=(
    "wget"
    "unzip"
    "gum"
    "rsync"
    "git"
)

# Синхронизация баз данных пакетов
sudo pacman -Sy
echo

# Установка необходимых пакетов
echo ":: Проверка установки необходимых пакетов..."
_installPackages "${installer_packages[@]}";

# Дополнительная проверка rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Принудительная установка rsync"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync проверен повторно"
fi
echo

# Установка Yay
_installYay
