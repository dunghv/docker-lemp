# docker-laravel-env
All the "core" processes (e.g. Nginx, PHP7-FPM, etc.) and "development" processes (e.g. composer, artisan etc.) each had their own container. 

## how to build
 * to build all containers just run:  `./rebuild` 
 * to build `docker-laravel-nginx` run: `./rebuild laravel-nginx`
 
## how to run
`docker-compose up -d`

## how to stop
`docker-compose down`

