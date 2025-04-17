FROM debian:bookworm-slim

# missing `binutils` results in error:
# [DEBUG]    [jlink] Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory

# todo: add error message when fakeroot is not installed

RUN apt-get update && apt-get install -y openjdk-17-jre-headless binutils fakeroot

COPY . /data
RUN cd /data && ./mvnw verify && ./mvnw -Pjdks

VOLUME /output
