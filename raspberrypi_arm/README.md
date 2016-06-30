These containers will only run on an ARM based system, such as a Raspberry Pi.

### How to install Docker on your Pi
As of this writing, the easiest way to get Docker on a Raspberry Pi is to use the Hypriot image. The base image can be found here:
http://blog.hypriot.com/downloads/

Once you have that running, you MUST do
```
apt-get update && apt-get install -y docker-hypriot docker-compose
```
This will ensure you have Docker 1.10+ and Docker Compose 1.6+, required to use this docker-compose.yml file

### Running BrewPi via Docker on your Pi
Once you have your Hypriot image running on your Pi, clone this repo, cd to either brewpi_single_container or brewpi_multi_container, and simply type
```
docker-compose pull && docker-compose up
```

If you wish to background these processes, just add a d!
```
docker-compose up -d
```
For those of you using an Arduino (legacy code) instead of the newer Spark, you'll need to specify that by using
```
system=arduino docker-compose up
```

If you want to rebuild your own brewpi image, you can
```
docker-compose build
```

With that, you should be good to go! Happy Brewing!
