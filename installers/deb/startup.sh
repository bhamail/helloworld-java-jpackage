#!/bin/bash

# this script is intended to be run inside the docker container

cd /data
./mvnw package jreleaser:assemble -Pjr-deb
echo "done building debian package"

# .deb is created at: data/target/jreleaser/assemble/helloworld/jpackage/helloworld_1.0.0-1_amd64.deb
cp /data/target/jreleaser/assemble/helloworld/jpackage/* /output/
