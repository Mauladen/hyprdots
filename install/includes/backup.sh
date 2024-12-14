backup_files=(
    ".config/alacritty"
    ".config/dunst"
    ".config/hypr"
    ".config/hyprdots"
    ".config/rofi"
    ".config/waybar"
    ".config/wlogout"
    ".bashrc"
)

echo -e "${GREEN}"
figlet "Backup"
echo -e "${NONE}"
echo "The script can create a backup of you existing configurations in .config and your .bashrc"
if gum confirm "Do you want to create a backup now" ;then

    # Create hyprdots folder
    if [ ! -d ~/hyprdots ] ;then
        mkdir ~/hyprdots
    fi

    # Get current timestamp
    datets=$(date '+%Y%m%d%H%M%S')

    # Create backup folder
    if [ ! -d ~/hyprdots/archive ] ;then
        mkdir ~/hyprdots/archive
    fi

    # Create backup folder
    if [ ! -d ~/hyprdots/backup ] ;then
        mkdir ~/hyprdots/backup
    else
        mkdir ~/hyprdots/archive/$datets
        cp -r ~/hyprdots/backup/. ~/hyprdots/archive/$datets/
    fi

    for df in "${backup_files[@]}"
    do
        if [ -d ~/$df ] ;then
            echo ":: Backup of $df"
            mkdir -p ~/hyprdots/backup/$df
            cp -r ~/$df ~/hyprdots/backup/$df
        fi
        if [ -f ~/$df ] && [ ! -L "${df}" ] ;then
            echo ":: Backup of $df"
            cp ~/$df ~/hyprdots/backup/$df
        fi
    done
elif [ $? -eq 130 ]; then
    echo ":: Installation canceled"
    exit 130
else
    echo ":: Backup skipped"
fi
