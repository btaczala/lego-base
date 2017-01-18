#!/bin/sh


# this is a test
docker build -t ev3/ev3 .
docker run --rm -it -v /home/bata/external/projects/lego:/src -w /src ev3/ev3
