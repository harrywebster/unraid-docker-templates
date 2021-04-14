FROM ubuntu:18.04

# Configure version numbers and settings
ENV DEBIAN_FRONTEND noninteractive
ENV PHP_VERSION 7.2

# Install base packages
RUN \
	apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:nginx/stable && \
	apt-get update && \
	apt-get install -y zip unzip apt-utils nginx nginx-extras git nano awscli && \
	rm -rf /var/lib/apt/lists/* && \
	chown -R www-data:www-data /var/lib/nginx

# Install Phalcon packages
RUN \
	add-apt-repository ppa:ondrej/php && \
	apt-get update && \
	apt-get install -y php${PHP_VERSION}-fpm php${PHP_VERSION}-cli php${PHP_VERSION}-common php${PHP_VERSION}-mysql php${PHP_VERSION}-curl php${PHP_VERSION}-gettext php${PHP_VERSION}-json php${PHP_VERSION}-mbstring php${PHP_VERSION}-pdo_* php${PHP_VERSION}-xml && \
	apt-get install -y openssl libpcre3-dev mysql-client && \
	apt-get install -y php${PHP_VERSION}-phalcon3

# Debugging packages
RUN apt-get install -y php-xdebug php7.2-dev phpunit

# The worker processes in the nginx image run as the user nginx with group
# nginx. This is where we override their respective uid and guid to something
# else that lines up better with file permissions.
# The -o switch allows reusing an existing user id
RUN groupmod -g 1000 www-data
RUN	usermod -u 1000 www-data

# Define working directory.
WORKDIR /root

COPY root/composer.json /root/composer.json

## Install PHP composer to allow us to install PHP plugins
RUN curl --silent --show-error https://getcomposer.org/installer | php

RUN \
	php${PHP_VERSION} /root/composer.phar require && \
	chown www-data:www-data /root/vendor && \
	mv /root/vendor /var/www/vendor

# Copy config files over to the docker image
COPY etc /etc
COPY root /root

# Set the timezone to be UTC (AKA GMT... always)
RUN \
	echo "Etc/UTC" > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata

# Fix permissions on copied files.
RUN chmod 755 /root/bin/entrypoint.sh

ENTRYPOINT /root/bin/entrypoint.sh
