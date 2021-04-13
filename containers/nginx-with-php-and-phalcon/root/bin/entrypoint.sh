#!/bin/bash

source ~/.bashrc

# Start PHP daemon
/etc/init.d/php7.2-fpm start

# you must restart PHP FPm to get access to the ENV variables, i have no idea why?!
/etc/init.d/php7.2-fpm restart

# start up bash to use for access
#nginx -g "daemon off;"
nginx

/bin/bash
