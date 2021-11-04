#!make

NAME				= inception
LOGIN				= mciupek
VOLUMES_PATH		= /home/$(LOGIN)/data
WP_HOST_VOLUME_PATH	= $(VOLUMES_PATH)/website
DB_HOST_VOLUME_PATH	= $(VOLUMES_PATH)/database
SRCS				= ./srcs
DOCKER_COMPOSE		= $(SRCS)/docker-compose.yml

COMPOSE				= docker-compose --file $(DOCKER_COMPOSE)

all: $(NAME)

build:
	$(COMPOSE) build

$(NAME): clean services volumes
	$(COMPOSE) up -d --build

clean: 
	$(COMPOSE) down

fclean:
	$(COMPOSE) down -v

eval:
	sh clean.sh

services:
	sudo service nginx stop
	sudo service mysql stop

volumes:
	mkdir -p $(WP_HOST_VOLUME_PATH)
	mkdir -p $(DB_HOST_VOLUME_PATH)

re: fclean all

.PHONY: build clean fclean all re eval services volumes