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
1. //`docker build -t rensite .` from within the folder
2. `docker pull paxson13/rensite:latest`
3. `docker run paxson13/rensite`

# how to view project
1. if you're on mac: `ifconfig` then look for en0 inet address. others, i dunno, probably ip a or ipconfig or something and still look for inet
2. `[your-inet-adress]:80` (80 is for port 80 since i specified that in my dockerfile) 

# create public repo in DockerHub
1. hub.docker.com web page, logged in
2. `create repository`
3. repo name: paxson-p4.0


# Authentication with dockerhub
**access tokens are recommended for authentication**
1. in dockerhub, go to user account -> security -> new access token
2. generate key
3. on desired system, run `docker login -u paxson13` and enter the key provided by dockerhub to login

# How to push container image to Dockerhub (without GitHub Actions)
1. create new tag with `docker image tag rensite paxson13/rensite:v1.0.0`
2. push to docker with `docker push paxson13/rensite:v1.0.0`

# Link to docker repo
https://hub.docker.com/repository/docker/paxson13/rensite/general

# configuring GitHub secrets
1. go to desired repository home page 
2. `settings` on the top bar
3. in settings, look for `security` in the sidebar, then `secrets and variables`, select the drop down, then `actions`
4. i put my secrets in `repo secrets`:
   - `DOCKER_PASSWORD`
   - `DOCKER_TOKEN`

# [Github workflow](https://docs.docker.com/build/ci/github-actions/)
1. follow guide 
this changed in p5 but [heres a link](./.github/workflows/ci.yml)
```
name: ci

on:
  push:
    branches:
      - "main"

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      -
        name: Checkout
        uses: actions/checkout@v4
      -
        name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      -
        name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: . [path]
          file: ./Dockerfile [path to dockerfile]
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/[image name]:latest 
```


