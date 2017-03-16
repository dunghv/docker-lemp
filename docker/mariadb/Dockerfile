FROM debian:jessie

MAINTAINER "Hoang Viet Dzung" <dung.hvd@gmail.com>

#make APT a little quieter
ENV DEBIAN_FRONTEND noninteractive

ENV MARIADB_MAJOR 10.1
ENV TERM dumb

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 199369E5404BD5FC7D2FE43BCBCB082A1BB943DB

# add repository pinning to make sure dependencies from this MariaDB repo are preferred over Debian dependencies
# libmariadbclient18 : Depends: libmysqlclient18 (= 5.5.42+maria-1~wheezy) but 5.5.43-0+deb7u1 is to be installed
RUN echo "deb http://ftp.osuosl.org/pub/mariadb/repo/$MARIADB_MAJOR/debian jessie main" > /etc/apt/sources.list.d/mariadb.list && \
    { \
        echo 'Package: *'; \
        echo 'Pin: release o=MariaDB'; \
        echo 'Pin-Priority: 999'; \
    } > /etc/apt/preferences.d/mariadb \
    && apt-get update && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/* \

    # the "/var/lib/mysql" stuff here is because the mysql-server postinst doesn't have an explicit way to disable the
    # mysql_install_db codepath besides having a database already "configured" (ie, stuff in /var/lib/mysql/mysql)
    && rm -rf /var/lib/mysql \
    && mkdir /var/lib/mysql

VOLUME /var/lib/mysql

# fix php container can not connect to mysql container
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
    && echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
    && mv /tmp/my.cnf /etc/mysql/my.cnf

COPY docker-mariadb.conf /etc/mysql/conf.d/mariadb.cnf
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]
