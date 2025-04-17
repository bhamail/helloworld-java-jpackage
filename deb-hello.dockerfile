FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y openjdk-17-jre-headless binutils fakeroot maven vim git

COPY . /data
RUN cd /data && ./mvnw verify && ./mvnw -Pjdks
