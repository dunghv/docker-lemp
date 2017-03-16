FROM debian:jessie

MAINTAINER "Hoang Viet Dzung" <dung.hvd@gmail.com>

WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y \
    php5-cli \
    php5-fpm \
    php5-curl \
    php5-gd \
    php5-imagick \
    php5-intl \
    php5-mcrypt \
    php5-memcache \
    php5-mysqlnd \
    php5-imap \
    php5-xdebug \
    gettext \
    php-gettext \
    php-apc \
    --no-install-recommends

COPY cli/php.ini               /otp/php5/cli/php.ini
COPY fpm/php.ini               /otp/php5/fpm/php.ini
COPY fpm/php-fpm.conf          /etc/php5/fpm/php-fpm.conf
COPY fpm/pool.d/www.conf       /etc/php5/fpm/pool.d/www.conf
COPY mods-available/xdebug.ini /etc/php5/mods-available/xdebug.ini

RUN php -r "readfile('http://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php --install-dir=/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

VOLUME /var/www
VOLUME /root/.composer

WORKDIR /var/www

EXPOSE 9001

ENTRYPOINT ["/usr/sbin/php5-fpm", "-F"]