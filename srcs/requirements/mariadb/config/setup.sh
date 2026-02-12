#!/bin/bash

set -x

sed -i 's/bind-adress .*=.*/bind-adress = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i '/^#port/c\port = 3306' /etc/mysql.mariadb.conf.d/50-server.cnf

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DBNAME ;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_ADMIN_USER'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PWD' ;"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DBNAME.* TO '$MARIADB_ADMIN_USER'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PWD' ;"
mariadb -e "FLUSH PRIVILEGES"

service mariadb stop

exec mysqld_safe
