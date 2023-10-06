#!/bin/bash
set -e

apt-get update

apt-get install -y nginx

[ ! -d "/var/html" ] && mkdir -p /var/html

cp -r /var/lib/docker/volumes/infra_frontend_static_data/_data /var/html/infra_frontend_static_data
cp -r /var/lib/docker/volumes/infra_backend_static_data/_data /var/html/infra_backend_static_data
cp -r /var/lib/docker/volumes/infra_media_data/_data /var/html/infra_media_data

chown -R www-data:www-data /var/html/infra_frontend_static_data
chown -R www-data:www-data /var/html/infra_backend_static_data
chown -R www-data:www-data /var/html/infra_media_data

chmod -R 755 /var/html/infra_frontend_static_data
chmod -R 755 /var/html/infra_backend_static_data
chmod -R 755 /var/html/infra_media_data

if [ -f "./nginx.conf" ]; then
    cp ./nginx.conf /etc/nginx/sites-available/dvmn_7

    [ ! -d "/etc/nginx/sites-enabled/" ] && mkdir /etc/nginx/sites-enabled/

    [ -L "/etc/nginx/sites-enabled/dvmn_7" ] && rm /etc/nginx/sites-enabled/dvmn_7

    ln -s /etc/nginx/sites-available/dvmn_7 /etc/nginx/sites-enabled/

    [ -f "/etc/nginx/sites-enabled/default" ] && rm /etc/nginx/sites-enabled/default

    nginx -t

    systemctl restart nginx
    systemctl enable nginx
    echo "NGINX is installed with the custom configuration."
    systemctl status nginx
else
    echo "Configuration file not found in the current directory."
fi
