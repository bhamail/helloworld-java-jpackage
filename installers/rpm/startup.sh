#!/bin/bash

# this script is intended to be run inside the docker container

cd /data
./mvnw package jreleaser:assemble -Pjr-rpm
echo "done building rpm package"

# .rpm is created at: data/target/jreleaser/assemble/helloworld/jpackage/helloworld-1.0.0-1.x86_64.rpm
cp -r /data/target/jreleaser/assemble/helloworld/jpackage/*.rpm /output/
