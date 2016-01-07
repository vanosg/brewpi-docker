# brewpi-docker
BrewPi Docker TEST repository

This is where we're working on dockerizing BrewPi. These files are constantly under construction, and may not be working at any given point in time. 

To launch a BrewPi instance, download the docker-compose.yml file, and then run 
```
docker-compose --x-networking up -d
```

## Description
#### brewpi
- This image contains a configured version of the current brewpi-script repository. Basically, this is the guts of BrewPi.

#### brewpi_nginx
- This image contains an nginx web server configured to run BrewPi. The current web interface files from brewpi-www are loaded.

#### brewpi_fpm
- This image is an instance of php-fpm, configured to run with brewpi_nginx in support of the web interface. 
