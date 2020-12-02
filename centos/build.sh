#!/bin/zsh

SOURCE=https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Container-8.1.1911-20200113.3-layer.x86_64.tar.xz
DIR=$0:A:h
INTERM="$DIR/resource/centos-base.tar.xz"
TARGET="$DIR/resource/centos-base.tar.gz"

if [[ -f "$TARGET" ]]; then
    echo "Base image file exists, not downloading"
else
    echo "Downloading CentOS base image"
    curl --silent --output $INTERM $SOURCE
    echo "Packing .xz to .gz"
    xz -dck $INTERM | gzip > $TARGET
    rm $INTERM
fi

docker build $DIR --tag jbndlr/centos:8.1.1911-1
