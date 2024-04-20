# Project 5: CD
## Project Overview

# Part 1: Semantic Versioning
## How to generate a tag in git / github

## Behavior of github workflow
(what does it do and when)
#### run when a tag is pushed
runs on push to main with a tag like v1.0.0
``` 
on:
  push:
    branches:
      - "main"
    tags:
      - 'v*.*.*'
```

#### use the docker/metadata-action to generate a set of tags from your repository
pushes git tag to docker - if git commit isn't tagged, workflow will push to latest instead
``` 
jobs:
  docker:
  steps:
.............
    name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: |
            paxson13/rensite
          tags: |
            latest
            type=semver,pattern={{raw}}
```
`pattern={{raw}}` copies the exact git tag into docker
1. git add -A
2. git commit -m "message"
3. git tag v*.\*.*
4. git p

## [Rensite Docker Hub repo](https://hub.docker.com/repository/docker/paxson13/rensite/general)