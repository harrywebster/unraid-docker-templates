#!/bin/bash

source ~/.bashrc

# Start PHP daemon
/etc/init.d/php7.4-fpm start

# start up bash to use for access
nginx -g "daemon off;"
