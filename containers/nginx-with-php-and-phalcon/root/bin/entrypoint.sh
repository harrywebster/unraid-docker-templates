#!/bin/bash

source ~/.bashrc

# Start PHP daemon
/etc/init.d/php7.2-fpm start

# start up bash to use for access
nginx -g "daemon off;"
