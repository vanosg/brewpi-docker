These containers will only run on an ARM based system, such as a Raspberry Pi. 

As of this writing, the easiest way to get Docker on a Raspberry Pi is to use the Hypriot image. The base image can be found here: 
http://blog.hypriot.com/downloads/

Once you have that running, you MUST do
```
apt-get update && apt-get install -y apt-get docker-hypriot docker-compose
```

This will ensure you have Docker 1.10+ and Docker Compose 1.6+, required to use this docker-compose.yml file

Once you have your Hypriot image running on your Pi, clone this repo, cd to this Directory, and simply type 
```
docker-compose up
```

If you wish to background these processes, just add a d!
```
docker-compose -d up  
```
