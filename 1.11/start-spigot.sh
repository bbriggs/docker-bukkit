#!/bin/bash
#Solution borrowed from https://github.com/itzg/dockerfiles/blob/master/minecraft-server/start-minecraft.sh
if [ ! -f /data/eula.txt ]; then
  if [ "$EULA" != "" ]; then
    echo "# Generated via Docker on $(date)" > eula.txt
    echo "eula=$EULA" > /data/eula.txt
  else
    echo ""
    echo "Please accept the Minecraft EULA at"
    echo "  https://account.mojang.com/documents/minecraft_eula"
    echo "by adding the following immediately after 'docker run':"
    echo "  -e EULA=TRUE"
    echo "or editing eula.txt to 'eula=true' in your server's data directory."
    echo ""
    exit 1
  fi
fi
cd /data
if [[ "$TRAVIS" = true ]]; then
    echo "stop" | java -jar /root/spigot-1.11.jar
else
    java -jar /root/spigot-1.11.jar
fi
