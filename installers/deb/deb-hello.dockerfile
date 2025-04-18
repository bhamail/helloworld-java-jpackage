FROM debian:bookworm-slim

# missing `binutils` results in error:
# [DEBUG]    [jlink] Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory

# todo: add error message when fakeroot is not installed

# jreleaser Need jdeps, hence jdk (devel, not jre)
# AArch64 jreleaser error:
#  Cannot run program "/usr/lib/jvm/java-17-openjdk-arm64/bin/jdeps" (in directory "/data/target/jreleaser/assemble/helloworld-jink/jlink/inputs/jars"): error=2, No such file or directory -> [Help 1]

#RUN apt-get update && apt-get install -y openjdk-17-jre-headless binutils fakeroot
RUN apt-get update && apt-get install -y openjdk-17-jdk binutils fakeroot

COPY . /data
RUN cd /data && ./mvnw verify && ./mvnw -Pjdks

VOLUME /output
