#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

echo "[+] Update system..."
apt-get update && apt-get full-upgrade -y

echo "[+] Install Apache, MariaDB, PHP"
apt install -y \
  apache2 \
  apache2-utils \
  php \
  libapache2-mod-php \
  php-cli \
  php-fpm \
  php-json \
  php-pdo \
  php-mysql \
  php-zip \
  php-gd \
  php-mbstring \
  php-curl \
  php-xml \
  php-pear \
  php-bcmath \
  mariadb-server \
  mariadb-client

echo "[+] Create phpinfo..."
echo '<?php phpinfo(); ?>' > /var/www/html/info.php

IP=$(ip -4 addr show scope global | awk '/inet/ {print $2}' | cut -d/ -f1 | head -n 1)

if [ -z "$IP" ]; then
    echo "[!] IP address tidak ditemukan"
    exit 1
fi

echo "[+] Server ready!"
echo "    http://$IP/"
echo "    http://$IP/info.php"
