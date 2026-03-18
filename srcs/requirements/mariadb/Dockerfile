FROM debian:bookworm

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./config/script.sh /
RUN chmod +x /script.sh

EXPOSE	3306

CMD [ "/script.sh" ]
