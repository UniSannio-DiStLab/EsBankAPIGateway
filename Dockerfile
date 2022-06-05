FROM maven:3.8.5-jdk-11

#SHELL ["/bin/bash", "-c"]

RUN mkdir -p /source
WORKDIR /source
ADD . /source/

RUN mvn -B package --file pom.xml

WORKDIR /source/target

USER root
RUN chmod 777 SpringGateway.jar
#ENTRYPOINT sleep 100000
ENTRYPOINT ./SpringGateway.jar

