#!/bin/zsh

SOURCE=https://github.com/gohugoio/hugo/releases/download/v0.79.0/hugo_0.79.0_Linux-64bit.tar.gz
DIR=$0:A:h
TARGET="$DIR/resource/hugo.tar.gz"
HUGOBIN="$DIR/resource/hugo"

if [[ -f "$HUGOBIN" ]]; then
    echo "Hugo binary exists, not downloading"
else
    echo "Downloading hugo"
    curl --silent --location --output $TARGET $SOURCE
    echo "Unpacking binary"
    tar xzvf $TARGET --directory "$DIR/resource/" hugo
    rm $TARGET
fi

docker build $DIR --tag jbndlr/hugo:0.0.1
