# Удаление существующих символических ссылок
for df in "${backup_files[@]}"; do
  if [ -L "${df}" ]; then
    rm ${df}
    echo ":: Символическая ссылка $df удалена"
  fi
done

# Копирование конфигурации в папку dotfiles
if [ -f ~/hyprdots-excludes.txt ]; then
  echo ":: Найден файл исключений для rsync"
  rsync -avhp -I --exclude-from=~/hyprdots-excludes.txt ~/hyprdots/$version/ ~/
else
  rsync -avhp -I ~/hyprdots/$version/ ~/
fi
echo ":: hyprdots установлены в ~/.config/"
