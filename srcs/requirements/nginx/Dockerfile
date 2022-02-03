FROM	debian:buster

RUN	apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	vim \
	&& rm -rf /var/lib/apt/lists/*

COPY	./tools/nginx.conf /etc/nginx/sites-available
RUN		ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

RUN	openssl req -x509 -nodes -days 365 \
	-subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=21SCHOOL/OU=schaya" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
	-out /etc/ssl/nginx-selfsigned.crt

RUN	chmod -R 777 /var/www/*
RUN	chown -R www-data:www-data /var/www/*


EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
