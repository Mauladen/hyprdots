SERVICES=(
  "NetworkManager"
  "bluetooth"
  "sddm"
)

for service in "${SERVICES[@]}"; do
  echo "Запуск службы $service..."
  if [ "$service" = "sddm" ]; then
    sudo systemctl enable "$service"
  else
    sudo systemctl enable --now "$service.service"
  fi
  sleep 2
done
