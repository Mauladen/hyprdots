echo -e "${GREEN}"figlet "Настройка SDDM"
echo -e "${NONE}"
echo "Рекомендуется перезагрузка системы."
echo
if gum confirm "Хотите настроить экран входа в систему?" ;then
    sudo cp -R  install/sddm/sdt /usr/share/sddm/themes/
    sudo chown -R $USER:$USER /usr/share/sddm/themes/sdt
    sudo mkdir -p /etc/sddm.conf.d
    echo -e "[Theme]\nCurrent=sdt" | sudo tee -a /etc/sddm.conf.d/10-theme.conf
    WLDIR=/usr/share/wayland-sessions
    if [ ! -d "$WLDIR" ]; then
        echo "$WLDIR не найдена, создание..."
        sudo mkdir $WLDIR
    else
        echo "$WLDIR найдена"
    fi

    # Копирование файла hyprland.desktop
    sudo cp install/sddm/hyprland.desktop $WLDIR

    # Копирование фона SDDM
    cp -f ~/.config/hyrpdots/wallpapers/wallpaper.jpg /usr/share/sddm/themes/sdt/wallpaper.jpg
elif [ $? -eq 130 ]; then
    exit 130
else
    echo ":: Настройка экрана входа в систему пропущена"
fi

