#!/bin/bash

echo Loading BASH profile
source ~/.bashrc

# Create AWS auth config
mkdir /root/.aws
echo "[default]" > /root/.aws/credentials
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> /root/.aws/credentials
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> /root/.aws/credentials
echo "[default]" > /root/.aws/config
echo "region=eu-west-2" >> /root/.aws/config
echo "output=json" >> /root/.aws/config
echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> /etc/environment
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> /etc/environment

echo Setting up MySQL database
/bin/bash /root/bin/mysql.sh

echo Build database content from markdown files
php /var/www/app/bin/build-sql-blog.php

echo Starting PHP
/etc/init.d/php7.4-fpm start

echo Starting NGINX webserver
nginx -g "daemon off;"
