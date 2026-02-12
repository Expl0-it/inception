COMPOSE_FILE = ./srcs/docker-compose.yml
LOGIN42 = mamichal

all: up

create:
	mkdir -p /home/$(LOGIN42)/data/wp
	chmod 777 /home/$(LOGIN42)/data/wp
	mkdir -p /home/$(LOGIN42)/data/mdb
	chmod 777 /home/$(LOGIN42)/data/mdb
	hostsed add 127.0.0.1 $(LOGIN42).42.fr

up: create
	docker compose -f $(COMPOSE_FILE) up -d --no-deps --build --remove-orphans --wait

down:
	docker compose -f $(COMPOSE_FILE) down

clean:
	hostsed rm 127.0.0.1 $(LOGIN42).42.fr
	docker system prune --all -f
	docker rm -q $$(docker ps -qa) 2> /dev/null || true
	docker rmi -f $$(docker images -qa) 2> /dev/null || true
	docker volume rm $$(docker volume ls -q) 2> /dev/null || true
	rm -rf	/home/$(LOGIN42)/data

fclean: down clean

re: fclean all

status:
	docker -ps

logs:
	echo "\n[ LOGS: mariadb ]\n"
	docker logs mariadb
	echo "\n[ LOGS: wordpress ]\n"
	docker logs wordpress
	echo "\n[ LOGS: nginx ]\n"
	docker logs nginx

.SILENT:

.PHONY: create up down clean fclean re
