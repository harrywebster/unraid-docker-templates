#!/bin/bash

## Export environment variables from `docker run...` command
export DB_READ
echo "DB_READ=$DB_READ" >> /etc/bash.bashrc
echo "DB_READ=$DB_READ" >> /etc/environment

export DB_WRITE
echo "DB_WRITE=$DB_WRITE" >> /etc/bash.bashrc
echo "DB_WRITE=$DB_WRITE" >> /etc/environment

env_types=(development production staging)

source ~/.bashrc

# Start PHP daemon
/etc/init.d/php7.2-fpm start

# you must restart PHP FPm to get access to the ENV variables, i have no idea why?!
/etc/init.d/php7.2-fpm restart

# start up bash to use for access
nginx -g "daemon off;"
