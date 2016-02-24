FROM php:7-fpm

RUN apt-get update &&\
    apt-get install -y libpng12-dev libmcrypt-dev &&\
    docker-php-ext-install mbstring pdo tokenizer gd mcrypt

# Configure PHP-FPM
RUN mkdir -p /data \
    cd /usr/local/etc/php-fpm.d \
    { \
        echo '[www]'; \
        echo 'listen = [::]:9000'; \
        echo 'env[DB_PORT_3306_TCP_ADDR] = $DB_PORT_3306_TCP_ADDR'; \
        echo 'display_errors = stderr'; \
        echo 'date.timezone = UTC;' \
    } | tee laravel.conf

VOLUME ["/data"]

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]