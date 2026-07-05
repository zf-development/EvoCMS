#!/bin/bash
set -e

PERSISTENT_DIR="/var/www/html/.persistent"

mkdir -p "$PERSISTENT_DIR" /var/www/html/upload/avatars /var/www/html/upload/thumbs
mkdir -p /var/www/html/logs /var/www/html/backups

# Migrate existing config.php into persistent storage (first deploy after upgrade)
if [ -f /var/www/html/config.php ] && [ ! -L /var/www/html/config.php ]; then
    mv /var/www/html/config.php "$PERSISTENT_DIR/config.php"
fi

# config.php survives container rebuilds via persistent volume
ln -sf "$PERSISTENT_DIR/config.php" /var/www/html/config.php

chown -R www-data:www-data "$PERSISTENT_DIR" /var/www/html/upload /var/www/html/logs /var/www/html/backups
chmod -R 775 "$PERSISTENT_DIR" /var/www/html/upload /var/www/html/logs /var/www/html/backups

exec "$@"
