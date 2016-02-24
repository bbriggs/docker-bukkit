# Bukkit for Docker
#     Copyright (C) 2015 Bren Briggs

#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License along
#     with this program; if not, write to the Free Software Foundation, Inc.,
#     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

FROM ubuntu:trusty
MAINTAINER Bren Briggs <briggs.brenton@gmail.com>
RUN apt-get update && apt-get install -y openjdk-7-jdk wget git
RUN mkdir /minecraft-workspace /minecraft /data
RUN wget -O /minecraft-workspace/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN cd /minecraft-workspace/ && java -jar BuildTools.jar --rev 1.8.3 2>&1 >/dev/null
RUN mv /minecraft-workspace/craftbukkit-*.jar /minecraft && mv /minecraft-workspace/spigot-*.jar /minecraft
RUN rm -rf /minecraft-workspace
EXPOSE 25565
WORKDIR /data
ADD start-minecraft.sh /root/start-minecraft.sh
ENTRYPOINT ["/bin/bash", "/root/start-minecraft.sh"]