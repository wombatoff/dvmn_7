#!/bin/bash

apt update

apt install -y nginx

cp ./infra/nginx.conf /etc/nginx/sites-available/dvmn_7

ln -s /etc/nginx/sites-available/dvmn_7 /etc/nginx/sites-enabled/

rm /etc/nginx/sites-enabled/default

systemctl restart nginx

systemctl enable nginx

echo "NGINX is installed with the custom configuration."

systemctl status nginx
