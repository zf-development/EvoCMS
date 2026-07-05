#!/bin/bash
set -e

mkdir -p /var/www/html/upload/avatars /var/www/html/upload/thumbs
chown -R www-data:www-data /var/www/html/upload /var/www/html/logs /var/www/html/backups
chmod -R 775 /var/www/html/upload /var/www/html/logs /var/www/html/backups

exec "$@"
