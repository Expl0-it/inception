FROM debian:bookworm

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install php -y
RUN apt-get install php8.2-fpm -y
RUN apt-get install php8.2-mysql -y
RUN apt-get install mariadb-client -y
RUN apt-get install curl -y

RUN service php8.2-fpm start

WORKDIR /var/www/html

RUN sed -i -e 's/listen = .*/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY ./config/script.sh /
RUN chmod 777 /script.sh

EXPOSE 9000

CMD [ "/script.sh" ]
