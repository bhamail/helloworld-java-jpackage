FROM redhat/ubi9
# todo: use ubi9-minimal

# missing `binutils` results in error:
# [DEBUG]    [jlink] Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory

# todo: rpmdevtools install not found for minimal image
#RUN microdnf upgrade && microdnf install java-17-openjdk-devel binutils rpmdevtools
# todo: try smaller jdk install (openjdk-devel needed for javac on minimal image)
RUN dnf upgrade && dnf install -y java-17-openjdk-devel binutils rpmdevtools

COPY . /data
#RUN cd /data && ./mvnw verify && ./mvnw -Pjdks

VOLUME /output
