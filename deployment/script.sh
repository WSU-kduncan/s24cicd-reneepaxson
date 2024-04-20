#! /bin/bash
docker stop rensite
docker rm rensite
docker pull paxson13/rensite:latest
docker run --name rensite -p 80:80 -d paxson13/rensite
