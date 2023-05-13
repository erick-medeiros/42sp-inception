FROM alpine:3.17

RUN apk add --update --no-cache nodejs npm git

RUN npm install npm -g \
&&	git clone https://github.com/louislam/uptime-kuma.git \
&&	cd uptime-kuma \
&&	npm run setup

WORKDIR /uptime-kuma

COPY data/ data/

EXPOSE 3001

CMD ["node", "server/server.js"]
