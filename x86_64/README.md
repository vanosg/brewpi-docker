

The containers in this diretory will only run on an x86 or x64 based system, NOT a Raspberry Pi.

To use these images, clone this repo, cd to this Directory, and simply type
```
docker-compose --x-networking up
```

If you wish to background these processes, just add a -d!
```
docker-compose -d --x-networking up  
```
