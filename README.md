Docker-LEMP
======
All the "core" processes (e.g. nginx, php-fpm, etc.) and "development" processes (e.g. composer, artisan etc.) each had their own container.

### What are included?

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

3. Put your project php code in root folder.   
    
    The document root path is pointed to `/public` by default (as some php frameworks like Laravel, Symphony, Yii...).  
     
    You can change it in `docker/nginx/app.conf`

### Usage

* Start server

    `docker-compose up`
    
* Stop server

    `docker-compose down`

* Some useful command
    
    `bin/run --help`
