FROM alpine:3.15

ARG MYSQL_HOST MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD

RUN apk add --no-cache php7-common php7-cgi php7-fpm php7-mysqli php7-json

RUN wget https://wordpress.org/wordpress-6.2.tar.gz -O wordpress.tar.gz && \
	tar xvf wordpress.tar.gz && \
	mkdir -p /data/wordpress/ && \
	mv wordpress/* /data/wordpress/ && \
	rm -rf wordpress

RUN cd /etc/php7/php-fpm.d/ && \
	sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" www.conf && \
	mkdir /var/log/php-fpm/ && \
	echo "access.log = /var/log/php-fpm/access.log" >> www.conf

WORKDIR /data/wordpress/

RUN cp wp-config-sample.php wp-config.php && \
	sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php && \
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php && \
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php  && \
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php

RUN mkdir -p /data/wordpress && \
	chmod -R 777 /data/wordpress

CMD ["php-fpm7", "-F"]