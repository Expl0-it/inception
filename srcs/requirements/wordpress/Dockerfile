FROM	debian:bookworm

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install php -y
RUN	apt-get install php7.4-fpm -y
RUN	apt-get install php7.4-mysql -y
RUN	apt-get install mariadb-client -y
RUN	apt-get install curl -y

RUN	service php7.4-fpm start

WORKDIR /var/www/html

RUN sed -i -e 's/listen = .*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf



RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar


COPY	./config/setup.sh /
RUN	chmod +x /setup.sh

EXPOSE 9000

CMD [ "/setup.sh" ]
