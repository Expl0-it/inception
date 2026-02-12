FROM	debian:bookworm

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install nginx -y
RUN	apt-get install openssl -y

RUN adduser \
	--system \
	--no-create-home \
	--shell /bin/false \
	--group \
	--disabled-login www

RUN mkdir -p /etc/nginx/ssl

RUN openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-newkey rsa:4096 \
	-keyout /etc/nginx/ssl/private.key \
	-out /etc/nginx/ssl/cert.crt \
	-subj "/C=PL/ST=Masovia/L=Warsaw/O=42Warsaw/OU=students/CN=$WP_DOMAIN/UID=$MYUID"
#possible mistake with variables upwords


COPY	./config/default /etc/nginx/sites-available/default

RUN	chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
