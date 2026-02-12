FROM	debian:bookworm

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install mariadb-server -y

COPY	./config/setup.sh /
RUN	chmod +x /setup.sh

EXPOSE 3306

CMD [ "/setup.sh" ]
