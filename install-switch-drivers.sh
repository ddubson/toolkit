#!/usr/bin/env bash

curl -o /usr/local/bin/switch-drivers.sh https://raw.githubusercontent.com/ddubson/.scripts/main/switch-drivers.sh
chmod +x /usr/local/bin/switch-drivers.sh
link /usr/local/bin/switch-drivers.sh /usr/local/bin/switch-drivers
echo "Installed!"