#!/bin/zsh

DIR=$0:A:h

docker build $DIR --tag jbndlr/dev-go:0.1.0
