if [ ! -d ~/hyprdots ] ;then
    mkdir ~/hyprdots
fi
if [ -d ~/hyprdots/$version ] ;then
    rm -rf ~/hyprdots/$version
fi
cp -r dotfiles ~/hyprdots/$version
echo ":: Конфигурация Hyprdots подготовлена в ~/hyprdots/$version"
