#! /bin/bash

set -xe

# Build
docker build --build-arg BUKKIT_VERSION=$TAG -t bbriggs/bukkit:$TAG .

# Test
docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bbriggs/bukkit:$TAG

if [[ "$TRAVIS_BRANCH" = "master" ]]; then
	docker push bbriggs/bukkit:$TAG
else
	exit 0
fi
