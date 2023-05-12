FROM alpine:3.16

ENV HUGO_DIR /var/www/website/

RUN apk add --update --no-cache hugo git

RUN hugo new site ${HUGO_DIR}

WORKDIR ${HUGO_DIR}

RUN echo Hello World > layouts/index.html

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0"]