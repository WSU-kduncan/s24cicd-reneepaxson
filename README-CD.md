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
``` 
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      -
        name: Checkout
        uses: actions/checkout@v4
      -
        name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: paxson13/rensite

```ಠಿ_ಠ (o˘◡˘o)(ง'̀-'́)ง
## [Rensite Docker Hub repo](https://hub.docker.com/repository/docker/paxson13/rensite/general)