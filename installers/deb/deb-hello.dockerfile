FROM debian:bookworm-slim

# missing `binutils` results in error:
# [DEBUG]    [jlink] Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory

RUN apt-get update && apt-get install -y openjdk-17-jre-headless binutils fakeroot

COPY . /data
RUN cd /data && ./mvnw verify && ./mvnw -Pjdks

#RUN chown -R nobody /output/*
VOLUME /output

#CMD ["pwd"]
#CMD ["./startup.sh"]
