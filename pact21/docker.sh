#!/bin/bash

# these can be adjusted if desired
REPO="pact2021tutorial"
TAG=20210927
ZIP_TAG=20210927
IMAGE_ZIP="docker-$REPO-$ZIP_TAG.tar.gz"
CONTAINER_NAME="opencilk"
TUTORIAL_DIR="tutorial"

load() {
    echo "docker load < $IMAGE_ZIP"
    docker load < $IMAGE_ZIP
}

copy_and_quit() {
    echo "docker run --name $CONTAINER_NAME $REPO:$TAG"
    docker run --name $CONTAINER_NAME $REPO:$TAG

    echo "docker cp $CONTAINER_NAME:/$TUTORIAL_DIR $PWD/$TUTORIAL_DIR"
    docker cp $CONTAINER_NAME:/$TUTORIAL_DIR $PWD/$TUTORIAL_DIR

    echo "docker stop $CONTAINER_NAME"
    docker stop $CONTAINER_NAME

    echo "docker rm $CONTAINER_NAME"
    docker rm $CONTAINER_NAME
}

run_with_mount() {
    echo "docker run -it -u=$(id -ur):$(id -gr) --name $CONTAINER_NAME --rm -v $PWD/tutorial:/tutorial $REPO:$TAG"
    docker run -it -u=$(id -ur):$(id -gr) --name $CONTAINER_NAME --rm -v $PWD/tutorial:/tutorial $REPO:$TAG
}

init() {
    load
    copy_and_quit
}

if [[ $# -eq 0 || $1 = "init" ]]; then
    init
elif [[ $# -gt 0 && $1 = "run" ]]; then
    run_with_mount
else
    echo "./docker.sh [init|run]"
fi
