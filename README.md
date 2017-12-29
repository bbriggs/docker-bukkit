### Supported tags and respective `Dockerfile` links

# Simple Tags

`1.8` ([1.8/Dockerfile](1.8/Dockerfile))
`1.8.3` ([1.8.3/Dockerfile](1.8.3/Dockerfile))
`1.8.7` ([1.8.7/Dockerfile](1.8.7/Dockerfile))
`1.8.8` ([1.8.8/Dockerfile](1.8.8/Dockerfile))
`1.9` ([1.9/Dockerfile](1.9/Dockerfile))
`1.9.2` ([1.9.2/Dockerfile](1.9.2/Dockerfile))
`1.9.4` ([1.9.4/Dockerfile](1.9.4/Dockerfile))
`1.10` ([1.10/Dockerfile](1.10/Dockerfile))
`1.11` ([1.11/Dockerfile](1.11/Dockerfile))
`1.12` ([1.12/Dockerfile](1.12/Dockerfile))
`1.12.1`([1.12.1/Dockerfile](1.12.1/Dockerfile))
`latest`([Dockerfile](Dockerfile))

# Docker Bukkit
## A Bukkit/Spigot server on docker
Bukkit, a moddable Minecraft server. On Docker. Neat, huh?

### Running the server
To start the server and accept the EULA in one fell swoop, just pass the `EULA=true` environment variable to Docker when running the container. I recommend mounting a directory from your host onto `/data` in the container to make map and server data persistent. 

Example:
`docker run -it -v /data:/data -p 25565:25565  -e EULA=true --name mc_server bbriggs/bukkit` 
