FROM alpine:3.16

ARG MYSQL_HOST MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD

RUN apk add --no-cache php81-common php81-cgi php81-fpm php81-mysqli

RUN wget https://wordpress.org/wordpress-6.2.tar.gz && \
	tar xvf wordpress-6.2.tar.gz && \
	mkdir -p /data/wordpress/ && \
	mv wordpress/* /data/wordpress/ && \
	rm -rf wordpress

RUN sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" /etc/php81/php-fpm.d/www.conf

WORKDIR /data/wordpress/

RUN cp wp-config-sample.php wp-config.php && \
	sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php && \
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php && \
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php  && \
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php

RUN mkdir -p /data/wordpress && chmod -R 777 /data/wordpress/

CMD ["php-fpm81", "-F"]
