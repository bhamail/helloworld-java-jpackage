FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y openjdk-17-jre-headless binutils fakeroot maven vim git

COPY . /data
RUN cd /data && ./mvnw verify && ./mvnw -Pjdks

VOLUME /output

CMD cd /data && ./mvnw package jreleaser:assemble -Pjr-deb && echo "done building debian package"

# .deb is created at: data/target/jreleaser/assemble/helloworld/jpackage/helloworld_1.0.0-1_amd64.deb
CMD cp /data/target/jreleaser/assemble/helloworld/jpackage/helloworld_1.0.0-1_amd64.deb /output/
