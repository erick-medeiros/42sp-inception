FROM alpine:3.16

RUN apk add --no-cache nginx openssl

RUN mkdir -p /data/www && echo "<h1>Hello World</h1>" > /data/www/index.html

COPY ./conf/http.conf /etc/nginx/http.d/http.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]