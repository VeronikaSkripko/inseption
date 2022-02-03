DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

run:
	mkdir -p ~/data/mysql
	mkdir -p ~/data/wordpress
	docker-compose -f $(DOCKER_COMPOSE_FILE) up
	
stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v
	
fclean: clean
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	docker ps -a;\
	docker images;\
	docker volume ls;\
	sudo rm -rf ~/data
	
re:	clean run
	
.PHONY: all run stop down clean fclean