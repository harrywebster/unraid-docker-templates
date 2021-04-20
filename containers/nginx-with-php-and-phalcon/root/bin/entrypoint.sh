#!/bin/bash

echo Loading BASH profile
source ~/.bashrc

echo Setting up MySQL database
/bin/bash /root/bin/mysql.sh

echo Build database content from markdown files
php /var/www/app/bin/build-sql-blog.php

echo Starting PHP
/etc/init.d/php7.4-fpm start

echo Starting NGINX webserver
nginx -g "daemon off;"
