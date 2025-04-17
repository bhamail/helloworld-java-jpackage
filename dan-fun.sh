

# Validation of .deb and .rpm creation using jlink and jpackage with Java 17 and Docker


# build the docker image used to create the .deb installer
docker build --tag "deb-hello" -f installers/deb/deb-hello.dockerfile .

# run the docker image to create the .deb installer
#docker run -v "$(pwd)/output":/output deb-hello /bin/bash /data/installers/deb/startup.sh
docker run --rm -v "$(pwd)/output":/output deb-hello /bin/bash /data/installers/deb/startup.sh

docker rmi deb-hello


# build the docker image used to create the .rpm installer
#docker build --tag "rpm-hello" -f rpm-hello.dockerfile .
