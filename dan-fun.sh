

# Validation of .deb and .rpm creation using jlink and jpackage with Java 17 and Docker

# clear out the output directory
rm -rf output/

# build the docker image used to create the .deb installer
docker build --tag "deb-hello" -f installers/deb/deb-hello.dockerfile .

# run the docker image to create the .deb installer
#docker run -v "$(pwd)/output":/output deb-hello /bin/bash /data/installers/deb/startup.sh
docker run --rm -v "$(pwd)/output":/output deb-hello /bin/bash /data/installers/deb/startup.sh

docker rmi deb-hello


# build the docker image used to create the .rpm installer
docker build --tag "rpm-hello" -f installers/rpm/rpm-hello.dockerfile .

# run the docker image to create the .rpm installer
#docker run -v "$(pwd)/output":/output rpm-hello /bin/bash /data/installers/rpm/startup.sh
docker run --rm -v "$(pwd)/output":/output rpm-hello /bin/bash /data/installers/rpm/startup.sh

docker rmi rpm-hello
