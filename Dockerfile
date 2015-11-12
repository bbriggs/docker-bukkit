# Bukkit for Docker

FROM ubuntu:trusty
MAINTAINER Bren Briggs <briggs.brenton@gmail.com>
ENV EULA false
RUN apt-get update && apt-get install -y openjdk-7-jdk wget git
RUN mkdir /minecraft-workspace /minecraft /data
RUN wget -O /minecraft-workspace/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN cd /minecraft-workspace/ && java -jar BuildTools.jar --rev 1.8.8
RUN mv /minecraft-workspace/craftbukkit-*.jar /minecraft && mv /minecraft-workspace/spigot-*.jar /minecraft
RUN echo "eula=${EULA}" > /minecraft/eula.txt
RUN rm -rf /minecraft-workspace
EXPOSE 25565
WORKDIR /data
ENTRYPOINT java -jar /minecraft/craftbukkit-1.8.8.jar