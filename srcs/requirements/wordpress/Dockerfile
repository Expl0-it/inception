# container's operating system
FROM debian:bookworm

# container's packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install php -y
RUN apt install php8.2-fpm -y
RUN apt install php8.2-mysql -y
RUN apt install mariadb-client -y
RUN apt install curl -y

# container's config
RUN service php8.2-fpm start

WORKDIR /var/www/html

RUN sed -i -e 's/listen = .*/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY ./config/script.sh /
RUN chmod 777 /script.sh

# port expose
EXPOSE 9000

# running the config script
CMD [ "/script.sh" ]
