FROM alpine:3.16

ARG REDIS_PASS

RUN apk add --no-cache redis

RUN echo "requirepass ${REDIS_PASS}" >> /etc/redis.conf
RUN sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf", "--protected-mode", "no"]