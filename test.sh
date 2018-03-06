#! /bin/bash

set -e

cd $TAG && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit
