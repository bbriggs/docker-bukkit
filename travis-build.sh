#! /bin/bash

set -xe

# Build
if [[ -z "$DOCKERFILE" ]]; then
	docker build --build-arg BUKKIT_VERSION=$TAG -t bbriggs/bukkit:$TAG .
else
	docker build -f $DOCKERFILE --build-arg BUKKIT_VERSION=$TAG -t bbriggs/bukkit:$TAG .
fi

# Test
docker run -it -p 25565:25565 -v /data:/data -e EULA=true -e TRAVIS=true bbriggs/bukkit:$TAG

if [[ "$TRAVIS_BRANCH" = "master" ]]; then
	docker push bbriggs/bukkit:$TAG
else
	exit 0
fi
