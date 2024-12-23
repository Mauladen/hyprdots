# -----------------------------------------------------
# Установка пакетов
# -----------------------------------------------------

packages=(
    qt5-wayland
    qt6-wayland
    polkit-gnome
    gtk4
    wl-clipboard
    cliphist
    pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    wireplumber
    networkmanager
    network-manager-applet
    bluez
    bluez-utils
    blueman
    zsh
    hyprland
    hypridle
    waybar
    rofi-wayland
    hyprlock
    foot
    swaync
    xdg-desktop-portal-hyprland
    swww
    fastfetch
    swappy
    grim
    slurp
    btop
    imagemagick
    pamixer
    pavucontrol
    thunar
    gvfs
    thunar-archive-plugin
    file-roller
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    tela-circle-icon-theme-dracula
    nwg-look
    kvantum
    firefox
    firefox-i18n-ru
    telegram-desktop
    qbittorrent
    obsidian
    nwg-dock-hyprland
    eza
    zoxide
    fzf
    dex
)

packages_aur=(
  visual-studio-code-bin
  bibata-cursor-theme
  wlogout
  fnm
  vkteams-bin
  hunspell-ru
)

_installPackages "${packages[@]}";
_installPackagesYay "${packages_aur[@]}";
