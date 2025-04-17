

# Validation of .deb and .rpm creation using jlink and jpackage with Java 17 and Docker


# build the docker image used to create the .deb installer
docker build --tag "deb-hello" -f deb-hello.dockerfile .

# run the docker image to create the .deb installer
docker run --tag "deb-hello" -v output:/output deb-hello

# build the docker image used to create the .rpm installer
docker build --tag "rpm-hello" -f rpm-hello.dockerfile .
