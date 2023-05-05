FROM alpine:3.16

RUN apk add --no-cache php81-common php81-cgi php81-fpm php81-mysqli php81-mysqlnd

RUN mkdir -p data/wordpress && \ 
	echo "<h1>Hello Safe World </h1>" > /data/wordpress/index.html

CMD ["php-fpm81", "-F"]