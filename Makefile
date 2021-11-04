#!make
include srcs/.env

COMPOSE			= cd srcs && docker-compose

all: .up

build:
	$(COMPOSE) build

.up: clean 
	mkdir -p $(WP_HOST_VOLUME_PATH)
	mkdir -p $(MARIADB_HOST_VOLUME_PATH)
	$(COMPOSE) up -d --build

clean: 
	$(COMPOSE) down

fclean:
	$(COMPOSE) down -v

eval:
	sh clean.sh

re: fclean all

.PHONY: build clean fclean all re .up eval