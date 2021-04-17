#!/bin/bash

echo Loading BASH profile
source ~/.bashrc

echo Setting up MySQL database
/bin/bash /root/bin/mysql.sh

echo Starting PHP
/etc/init.d/php7.4-fpm start

echo Starting NGINX webserver
nginx -g "daemon off;"
