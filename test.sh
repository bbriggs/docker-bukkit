#! /bin/bash

set -e

docker build .

# Build all the versions sequentially. Pack a lunch, this takes a while.
cd ./1.8 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.8.3 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.8.7 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.8.8 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.9 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.9.2 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.9.4 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.10 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.11 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.12 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.12.1 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
cd ./1.12.2 && docker build -t bukkit . && docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bukkit && cd ..
