DOCKER_COMPOSE_FILE=srcs/docker-compose.yml
SCRIPT_HOST=srcs/host.sh
VOLUMES_FOLDER=/home/eandre-f/data

all: up

up:
	@sh $(SCRIPT_HOST) install
	@make -C ./srcs/requirements/nginx/ssl --no-print-directory
	@sudo mkdir -p $(VOLUMES_FOLDER)/wordpress $(VOLUMES_FOLDER)/mariadb
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build --detach

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

ls:
	docker image ls -a
	docker container ls -a
	docker volume ls
	docker network ls -f type=custom

clean:
	docker image prune -f

fclean: clean
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes
	@sh $(SCRIPT_HOST) remove
	@sudo rm -fr $(VOLUMES_FOLDER)

re: fclean all

run: all clean ls

.PHONY: all up down ls clean fclean re run