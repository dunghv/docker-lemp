FROM debian:jessie

MAINTAINER "Hoang Viet Dzung" <dung.hvd@gmail.com>

WORKDIR /tmp

RUN apt-get update -y \
    && apt-get install -y nginx \
    && rm /etc/nginx/sites-enabled/* \
    && mkdir -p /var/www \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY app.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www

VOLUME ["/var/www"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]