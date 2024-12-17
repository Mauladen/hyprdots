# -----------------------------------------------------
# Установка пакетов
# -----------------------------------------------------

packages=(
    qt5-wayland
    qt6-wayland
    qt5-svg
    qt5-quickcontrols2
    qt5-graphicaleffects
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
    foot
    mako
    xdg-desktop-portal-hyprland
    swww
    hyprlock
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
    starship
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    noto-fonts-emoji
    tela-circle-icon-theme-dracula
    nwg-look
    kvantum
    sddm
    firefox
    firefox-i18n-ru
    telegram-desktop
    qbittorrent
    obsidian
    nwg-dock-hyprland
)

packages_aur=(
  visual-studio-code-bin
  bibata-cursor-theme
  wlogout
  oh-my-zsh-git
  fnm
)

_installPackages "${packages[@]}";
_installPackagesYay "${packages_aur[@]}";
