FROM alpine:3.16

RUN apk add --no-cache nginx openssl

COPY ./conf/https.conf /etc/nginx/http.d/https.conf
COPY ./ssl/certificate.crt /etc/nginx/ssl/certificate.crt
COPY ./ssl/certificate.key /etc/nginx/ssl/certificate.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]