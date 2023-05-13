FROM alpine:3.15

ENV ADMINER_VERSION 4.8.1
ENV ADMIN_URL https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}-mysql.php

RUN apk add --update --no-cache php7-common php7-cgi php7-fpm php7-mysqli \ 
	php7-json php7-pecl-redis php7 php7-phar php7-tokenizer php7-ctype

RUN cd /etc/php7/php-fpm.d/ && \
	sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" www.conf && \
	mkdir /var/log/php-fpm/ && \
	echo "access.log = /var/log/php-fpm/access.log" >> www.conf

WORKDIR /data/adminer

RUN wget ${ADMIN_URL} -O index.php

EXPOSE 9000

CMD ["php-fpm7", "-F"]