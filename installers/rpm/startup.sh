#!/bin/bash

# this script is intended to be run inside the docker container

cd /data
./mvnw package jreleaser:assemble -Pjr-rpm
echo "done building rpm package"

# .deb is created at: data/target/jreleaser/assemble/helloworld/jpackage/helloworld_1.0.0-1_amd64.rpm
cp -r /data/target/jreleaser/assemble/helloworld/jpackage/*.rpm /output/
