#!/bin/bash

apt update

apt install -y nginx

if [ -f "./nginx.conf" ]; then
    cp ./nginx.conf /etc/nginx/sites-available/dvmn_7

    if [ $? -eq 0 ]; then
        [ ! -d "/etc/nginx/sites-enabled/" ] && mkdir /etc/nginx/sites-enabled/

        [ -L "/etc/nginx/sites-enabled/dvmn_7" ] && rm /etc/nginx/sites-enabled/dvmn_7

        ln -s /etc/nginx/sites-available/dvmn_7 /etc/nginx/sites-enabled/

        [ -f "/etc/nginx/sites-enabled/default" ] && rm /etc/nginx/sites-enabled/default

        nginx -t

        if [ $? -eq 0 ]; then
            systemctl restart nginx
            systemctl enable nginx
            echo "NGINX is installed with the custom configuration."
            systemctl status nginx
        else
            echo "There is an error in the NGINX configuration."
        fi
    else
        echo "Failed to copy the configuration file."
    fi
else
    echo "Configuration file not found in the current directory."
fi
