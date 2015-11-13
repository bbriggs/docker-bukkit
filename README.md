#Docker Bukkit
##A Bukkit/Spigot server on docker
Current build runs Bukkit only, although Spigot is compiled as well.
Tags follow version numbers, or you can track the latest version by using `latest`.
Tags: 
* `latest` ([latest/Dockerfile](https://github.com/bbriggs/docker-bukkit/blob/latest/Dockerfile))
* `1.8.8`  ([1.8.8/Dockerfile](https://github.com/bbriggs/docker-bukkit/blob/1.8.8/Dockerfile))

###Running the server
While it is already a good idea to create a data directory to make server data persistent across container restarts, in the current version you cannot start the server without the data directory as you need to accept the EULA. Therefore, I recommend this method:

`mkdir /data && echo "eula=true" > /data/eula.txt`

Then mount your new /data directory into the container, map the port, and start the container:

`docker run -it -v /data:/data -p 25565:25565  --name mc_server bbriggs/bukkit` 