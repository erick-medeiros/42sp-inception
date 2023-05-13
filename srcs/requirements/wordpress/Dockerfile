FROM alpine:3.15

ARG MYSQL_HOST MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD \
	REDIS_HOST REDIS_PORT REDIS_PASS

ENV WP_CLI_URL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
ENV WP_URL https://wordpress.org/wordpress-6.2.tar.gz

RUN apk add --update --no-cache php7-common php7-cgi php7-fpm php7-mysqli \ 
	php7-json php7-pecl-redis php7 php7-phar php7-tokenizer php7-ctype

RUN wget ${WP_URL} -O wordpress.tar.gz && \
	tar xvf wordpress.tar.gz && \
	mkdir -p /data/wordpress/ && \
	mv wordpress/* /data/wordpress/ && \
	rm -rf wordpress wordpress.tar.gz

RUN wget ${WP_CLI_URL} && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

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

RUN wp config set WP_REDIS_HOST "${REDIS_HOST}" ; \
	wp config set WP_REDIS_PORT "${REDIS_PORT}" ; \
	wp config set WP_REDIS_PASSWORD "${REDIS_PASS}"

RUN mkdir -p /data/wordpress && \
	chmod -R 777 /data/wordpress

COPY scripts/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT [ "setup.sh" ]

EXPOSE 9000

CMD ["php-fpm7", "-F"]