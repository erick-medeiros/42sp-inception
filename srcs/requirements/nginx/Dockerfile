FROM alpine:3.16

RUN apk add --no-cache nginx openssl

RUN mkdir -p /data/www && \
	echo "<h1>Hello Safe World</h1>" > /data/www/index.html

COPY ./conf/https.conf /etc/nginx/http.d/https.conf
COPY ./ssl/certificate.crt /etc/nginx/ssl/certificate.crt
COPY ./ssl/certificate.key /etc/nginx/ssl/certificate.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]