

# Validation of .deb and .rpm creation using jlink and jpackage with Java 17 and Docker

# clear out the output directory
rm -r output/*
mkdir output

# clean out target dir (deletes prior jdk downloads, etc)
./mvnw clean

# build executable jar, etd
./mvnw package

# download jdks needed for packaging
./mvnw -Pjdks

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
