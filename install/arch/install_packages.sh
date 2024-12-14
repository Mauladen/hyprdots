# -----------------------------------------------------
# Установка пакетов
# -----------------------------------------------------

prep_stage=(
    "qt5-wayland"
    "qt6-wayland"
    "qt5-svg"
    "qt5-quickcontrols2"
    "qt5-graphicaleffects"
    "polkit-gnome"
    "gtk4"
    "wl-clipboard"
    "cliphist"
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio"
    "pipewire-jack"
    "pipewire-pulse"
    "wireplumber"
    "networkmanager"
    "network-manager-applet"
    "bluez"
    "bluez-utils"
    "blueman"
)

installer_packages=(
    "zsh"
    "hyprland"                          # Композитный оконный менеджер Wayland
    "waybar"                            # Настраиваемая панель статуса для Wayland
    "rofi-wayland"                      # Программа запуска приложений для Wayland
    "kitty"                             # Современный быстрый эмулятор терминала
    "mako"                              # Система уведомлений для Wayland
    "xdg-desktop-portal-hyprland"       # Портал для интеграции с рабочим столом
    "hyprpaper"                         # Менеджер обоев для Hyprland
    "hyprlock"                          # Экран блокировки для Hyprland
    "fastfetch"                         # Быстрый системный информер
    "swappy"                            # Редактор скриншотов для Wayland
    "grim"                              # Утилита создания скриншотов в Wayland
    "slurp"                             # Выбор области экрана в Wayland
    "btop"                              # Мониторинг системных ресурсов
    "imagemagick"                       # Инструмент обработки изображений
    "pamixer"                           # Управление звуком через терминал
    "pavucontrol"                       # Управление звуком через GUI
    "thunar"                            # Файловый менеджер
    "gvfs"                              # Поддержка корзины и монтирования устройств
    "thunar-archive-plugin"             # Плагин архивации для Thunar
    "file-roller"                       # Менеджер архивов
    "starship"                          # Настраиваемая командная строка
    "ttf-jetbrains-mono"                # Моноширинный шрифт JetBrains
    "ttf-jetbrains-mono-nerd"           # Шрифт JetBrains с иконками Nerd Fonts
    "noto-fonts-emoji"                  # Шрифт эмодзи от Google
    "catppuccin-gtk-theme-mocha"        # Тема GTK в стиле Catppuccin Mocha
    "tela-circle-icon-theme-dracula"    # Набор иконок Tela Circle
    "bibata-cursor-theme"               # Тема курсора Bibata
    "nwg-look-bin"                      # Настройка тем GTK
    "kvantum"                           # Настройка тем Qt
    "sddm"                              # Менеджер входа в систему
    "firefox"                           # Веб-браузер
    "telegram-desktop"                  # Мессенджер Telegram
    "visual-studio-code-bin"            # Редактор кода
    "qbittorrent"                       # Торрент-клиент
    "obsidian"                          # Приложение для заметок
    "wttrbar"
)


installer_yay=(
    "wlogout"
)

_installPackages "${installer_packages[@]}";
_installPackagesYay "${installer_yay[@]}";
