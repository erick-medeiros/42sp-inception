DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

all: up

up:
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

re: fclean all

delete:
	docker system prune -f

run: all clean ls

.PHONY: all up down ls clean fclean re delete run