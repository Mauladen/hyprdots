#!/bin/bash

# _  _  _  _  ____  ____  ____   __  ____  ____
# / )( \( \/ )(  _ \(  _ \(    \ /  \(_  _)/ ___)
# ) __ ( )  /  ) __/ )   / ) D ((  O ) )(  \___ \
# \_)(_/(__/  (__)  (__\_)(____/ \__/ (__) (____/

# -----------------------------------------------------
# Версия скрипта
# -----------------------------------------------------
version=$(cat install/version)

# -----------------------------------------------------
# Загрузка вспомогательных функций для работы скрипта
# -----------------------------------------------------
source install/arch/library.sh

# -----------------------------------------------------
# Заголовок
# -----------------------------------------------------
source install/includes/header.sh

# -----------------------------------------------------
# Установка обязаттельных пакетов
# -----------------------------------------------------
source install/arch/install_required.sh

# -----------------------------------------------------
# Подтверждение
# -----------------------------------------------------
source install/includes/confirm.sh

# -----------------------------------------------------
# Поодготовка
# -----------------------------------------------------
source install/includes/preparation.sh

# -----------------------------------------------------
# Установка пакетов
# -----------------------------------------------------
source install/arch/install_packages.sh

# -----------------------------------------------------
# Установка Docker
# -----------------------------------------------------
source install/includes/docker.sh

# -----------------------------------------------------
# Запуск сервисов
# -----------------------------------------------------
source install/includes/services.sh

# -----------------------------------------------------
# Создание резервной копии
# -----------------------------------------------------
source install/includes/backup.sh

# -----------------------------------------------------
# Восстановление настроек
# -----------------------------------------------------
source install/includes/restore.sh

# -----------------------------------------------------
# Настройка ZSH
# -----------------------------------------------------
source install/includes/zsh.sh

# -----------------------------------------------------
# Копирование файлов
# -----------------------------------------------------
source install/includes/copy.sh

# -----------------------------------------------------
# Настройка SDDM
# -----------------------------------------------------
source install/includes/sddm.sh

# -----------------------------------------------------
# Перезагрузка
# -----------------------------------------------------
source install/includes/reboot.sh
