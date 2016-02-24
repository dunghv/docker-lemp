FROM docker-php7cli:latest

MAINTAINER "Hoang Viet Dzung" <dung.hvd@gmail.com>

WORKDIR /tmp

RUN apt-get update &&\
    apt-get install -y libpng12-dev &&\
    docker-php-ext-install mbstring pdo tokenizer gd

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["php", "artisan"]