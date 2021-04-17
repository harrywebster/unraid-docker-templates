#!/bin/bash

# Initialize MySQL database.
# ADD this file into the container via Dockerfile.
# Assuming you specify a VOLUME ["/var/lib/mysql"] or `-v /var/lib/mysql` on the `docker run` command…
# Once built, do e.g. `docker run your_image /path/to/docker-mysql-initialize.sh`
# Again, make sure MySQL is persisting data outside the container for this to have any effect.

MYSQL_DB=waterme
MYSQL_USER=watermeuser
MYSQL_PASS=mmkWSUWj1_0sd8

set -e
set -x

mysql_install_db

# Start the MySQL daemon in the background.

/etc/init.d/mysql start
mysql_pid=$!

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

mysql -e "SET GLOBAL interactive_timeout = 28800"
mysql -e "SET GLOBAL wait_timeout = 28800"

mysql -e "CREATE DATABASE $MYSQL_DB"
mysql $MYSQL_DB < /database.sql

mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS'"
mysql -e "GRANT SELECT ON $MYSQL_DB.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASS'"

# Permit root login without password from outside container.
#mysql -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '' WITH GRANT OPTION"

mysql -e "FLUSH PRIVILEGES"

echo DONE
