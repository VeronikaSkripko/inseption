FROM debian:buster

EXPOSE	3306

RUN		apt-get update
RUN     echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN     apt-get install -y -q

RUN	apt-get update && \
 	apt-get install -y \
 	mariadb-server \
 	vim \
 	&& rm -rf /var/lib/apt/lists/*
 	
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN  chmod 744 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh /var/lib/mysql
COPY ./tools/tmp.sql /

RUN	  chmod 744 /var/lib/mysql/init.sh 

CMD ["bash", "/var/lib/mysql/init.sh"]
