DOCKER_VOLUME := /home/junhjeon/data

build:
	mkdir -p $(DOCKER_VOLUME)/data_wp
	mkdir -p $(DOCKER_VOLUME)/data_db
	docker compose up -d --build

stop:
	docker compose stop

start:
	docker compose start

down:
	docker compose down

clean: down
	docker rmi wordpress
	docker rmi mariadb
	docker rmi nginx

.PHONY: build stop down clean start
