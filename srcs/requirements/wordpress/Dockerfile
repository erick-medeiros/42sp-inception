FROM alpine:3.16

RUN apk add --no-cache php81-common php81-cgi php81-fpm php81-mysqli php81-mysqlnd

RUN mkdir -p data/wordpress && \ 
	echo -e "<?php\nphpinfo();\n?>" > /data/wordpress/index.php

RUN cd /etc/php81/php-fpm.d/ && \
	sed 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' www.conf > bk && \
	mv bk www.conf

CMD ["php-fpm81", "-F"]