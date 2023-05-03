FROM alpine:3.16

RUN apk add --no-cache nginx

RUN mkdir -p /data/www && echo "<h1>Hello World</h1>" > /data/www/index.html

COPY ./conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]