FROM redhat/ubi8-minimal

RUN microdnf upgrade && microdnf install java-17-openjdk vim git

COPY . /data
#RUN cd /data && ./mvnw verify && ./mvnw -Pjdks
