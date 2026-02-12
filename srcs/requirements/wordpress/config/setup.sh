#!/bin/bash

set -x

mkdir -p /var/www/html
mkdir -p /run/php
cd /var/www/html

wp-cli.phar core download --allow-root

wp-cli.phar config create \
	--dbname=$MARIADB_DBNAME \
	--dbuser=$MARIADB_ADMIN_USER \
	--dbpass=$MARIADB_ADMIN_PWD --dbhost=mariadb:3306 \
	--allow-root \
	--skip-check

wp-cli.phar core install \
	--url=$WP_DOMAIN \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email \
	--allow-root

wp-cli.phar user create $WP_ADMIN_USER $WP_ADMIN_EMAIL \
	--role=administrator \
	--user_pass=$WP_ADMIN_PWD \
	--allow-root

wp-cli.phar user create $WP_USER $WP_EMAIL \
	--user_pass=$WP_PWD \
	--allow-root

wp-cli.phar config set FORCE_SSS_ADMIN 'false' --allow-root

wp-cli.phar theme install kubio --activate --allow-root
wp-cli.phar plugin update --all --allow-root

chmod 777 /var/www/html/wp-content

/usr/sbin/php-fpm7.4 -F
