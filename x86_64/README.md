# brewpi-docker

The containers in this diretory will only run on an x86 or x64 based system, NOT a Raspberry Pi.

To run the BrewPi image with the appropriate configuration, we have constructed a docker-compose.yml file. To launch a BrewPi instance, from this directory, simply run:
```
docker-compose --x-networking up -d
```

This will launch BrewPi as a docker container. Files that require persistance, such as data logs or temperature profiles, will be stored on the host system at ~/brewpi-data (the ~ represents the home directory of whichever user you are running the container from). 

#FAQ / Troubleshooting
### Service 'version' doesn't have any configuration options
Starting the BrewPi container by using the docker-compose file, I get:
```
ERROR: In file './docker-compose.yml' service 'version' doesn't have any configuration options. 
All top level keys in your docker-compose.yml must map to a dictionary of configuration options.
```
This most likely means your docker-compose is not the most recent. 
```
docker-compose -v
```
should return a version of 1.7 or higher. If not, you'll have to upgrade. Because of how docker split out its install process, this is not the most straightforward thing. If running
```
dpkg -l |grep docker
```
shows docker-compose in the list, follow these steps:
* Remove docker-compose with 
```
apt-get remove docker-compose
```
* Install docker-compose using pip
```
  pip install --upgrade docker-compose
```
* Confirm docker-compose is now 1.7 or higher with
```
docker-compose -v
```
### /dev/ttyAMC0 not detected
When starting the BrewPi container with docker-compose, I get
```
ERROR: for brewpi  linux runtime spec devices: error gathering device information 
while adding custom device "/dev/ttyACM0": lstat /dev/ttyACM0: no such file or directory
```
With docker, USB is treated almost the same as a NAT firewall- you have to forward the USB ports into the docker container in order for it to be accessible. /dev/ttyAMC0 is the most common location that the BrewPi resides on a Linux-based system, but this may differ on a BSD or Mac based system. This error could mean that either 
* The BrewPi is not connected to the USB of the host, and thus cannot be forwarded to the docker container
* The BrewPi is connected, but was mounted at a location other than /dev/ttyACM0 on the host machine

If you are sure the BrewPi is connected via USB to the host, check to see if the USB connection is mounted elsewhere. If it is, you can edit the docker-compose.yml file and change the line from
```
- "/dev/ttyACM0:/dev/ttyACM0"
```
to 
```
- "/your/path/here:/dev/ttyACM0"
```
