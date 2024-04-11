# CI Project Overview
i am containerizing a nginx website build using docker.

# how to install docker
1. i'm on mac so i just downloaded docker desktop

# how to build image from dockerfile
1. `vim Dockerfile`
2. file contents:
```
FROM [image file] (i used nginx)
COPY [necessary contents to local directories, like site / config files]
RUN [command](in my case i rm'd any previous config files in the base image)
COPY [necessary files to the image]
EXPOSE [port] (binds to particular port) 
```
3. `docker build -t image_name .`

# how to run container
1. `docker build -t rensite .` from within the folder
2. `docker pull paxson13/rensite:latest`
3. `docker run --name rensite -p 80:80 -d rensite`

# how to view project
1. if you're on mac: `ifconfig` then look for inet address. others, i dunno, probably ip a or ipconfig or something and still look for inet
2. `[your-inet-adress]:80` (80 is for port 80 since i specified that in my dockerfile) 
