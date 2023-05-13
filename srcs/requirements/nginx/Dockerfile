FROM alpine:3.16

RUN apk add --no-cache nginx openssl

WORKDIR /var/lib/nginx/html

COPY ./conf/https.conf /etc/nginx/http.d/https.conf
COPY ./ssl/certificate.crt /etc/nginx/ssl/certificate.crt
COPY ./ssl/certificate.key /etc/nginx/ssl/certificate.key
COPY static/index.html ./website/index.html

RUN chown nginx:nginx ./website/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]