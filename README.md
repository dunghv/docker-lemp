Laravel-Docker
======
All the "core" processes (e.g. nginx, php-fpm, etc.) and "development" processes (e.g. composer, artisan etc.) each had their own container.

### What is included?

* [x] php5 (cli & fpm)
* [x] php7 (cli & fpm)
* [x] nginx
* [x] mariadb
* [ ] redis
* [ ] mongodb

### Setup

1. Install docker

2. Choose your php version in docker-compose.yml 

    `context: docker/php7`

### Usage

* Start server

    `docker-compose up`
    
* Stop server

    `docker-compose down`

* Some useful command
    
    `bin/run --help`