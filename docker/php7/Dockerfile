FROM debian:jessie

MAINTAINER "Hoang Viet Dzung" <dung.hvd@gmail.com>

WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y wget

RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list && \
    wget https://www.dotdeb.org/dotdeb.gpg && \
    apt-key add dotdeb.gpg && \
    apt-get update

RUN apt-get install -y \
    php7.0-cli \
    php7.0-fpm \
    php7.0-curl \
    php7.0-gd \
    php7.0-imagick \
    php7.0-intl \
    php7.0-mcrypt \
    php7.0-mbstring \
    php7.0-memcache \
    php7.0-mysql \
    php7.0-imap \
    php7.0-xdebug \
    php7.0-redis \
    php7.0-mongo \
    php7.0-xml \
    gettext \
    php-gettext \
    php-apc \
    --no-install-recommends

RUN apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get autoclean

COPY fpm/php.ini                /etc/php/7.0/fpm/php.ini
COPY fpm/php-fpm.conf           /etc/php/7.0/fpm/php-fpm.conf
COPY cli/php.ini                /etc/php/7.0/cli/php.ini
COPY fpm/pool.d/www.conf        /etc/php/7.0/fpm/pool.d/www.conf
COPY mods-available/xdebug.ini  /etc/php/7.0/mods-available/xdebug.ini

RUN php -r "readfile('http://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php --install-dir=/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

VOLUME /var/www
VOLUME /root/.composer

WORKDIR /var/www

EXPOSE 9001

ENTRYPOINT ["/usr/sbin/php-fpm7.0", "-F"]