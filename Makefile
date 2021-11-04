#!make

NAME				= inception
LOGIN				= mciupek
SITE				= $(LOGIN).42.fr
USER				= root42
VOLUMES_PATH		= /home/$(LOGIN)/data
WP_HOST_VOLUME_PATH	= $(VOLUMES_PATH)/website
DB_HOST_VOLUME_PATH	= $(VOLUMES_PATH)/database
SRCS				= ./srcs
DOCKER_COMPOSE		= $(SRCS)/docker-compose.yml

COMPOSE				= docker-compose --file $(DOCKER_COMPOSE)

all: $(NAME)

build:
	$(COMPOSE) build

$(NAME): services volumes
	$(COMPOSE) up -d --build

down: 
	$(COMPOSE) down

vdown:
	$(COMPOSE) down -v

eval:
	sh clean.sh

services:
	sudo service nginx stop
	sudo service mysql stop

volumes:
	mkdir -p $(WP_HOST_VOLUME_PATH)
	mkdir -p $(DB_HOST_VOLUME_PATH)

re: vdown all

curl:
	curl -k $(SITE)

db:
	docker exec -it mariadb bash && \
	mysql -u $(USER) -p

.PHONY: build down vdown all re eval services volumes curl db