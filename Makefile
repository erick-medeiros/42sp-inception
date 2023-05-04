DOCKER_COMPOSE_FILE=srcs/docker-compose.yml
SCRIPT_HOST=srcs/host.sh

all: up

up:
	@sh $(SCRIPT_HOST) install
	@make -C ./srcs/requirements/nginx/ssl --no-print-directory
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build --detach

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

ls:
	docker image ls -a
	docker container ls -a

clean:
	docker image prune -f

fclean: clean
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all
	@sh $(SCRIPT_HOST) remove

re: fclean all

run: all clean ls

.PHONY: all up down ls clean fclean re run