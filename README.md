# A (Spigot) Minecraft Server with Docker

This Docker container is made to run a spigot or bukkit Minecraft server.

## Getting started
1. Make sure you have [Docker](https://www.docker.com/community-edition#/download) installed (tested with v17.09 on Ubuntu 16.04 and Debian Jessie).

2. Clone this repository (e.g.: `git clone https://github.com/JoramM/spigot-docker.git`)

3. Build the container
```
docker build -t minecraft .
```
4. If you just want to run a new minecraft server, continue with step 5. If you want to use your existing server, copy all files of your existing server directory (with the files like `server.properties`, `ops.json`, ... and the world folders) to the `server-data` folder.

5. Run the container (line 1: `interactive` mode, line 2: `detached` mode)
```
docker run -it --rm -v $PWD/server-data:/minecraft -p 25565:25565 --name minecraft minecraft
docker run -it -d --rm -v $PWD/server-data:/minecraft -p 25565:25565 --name minecraft minecraft
```
You can also detach from the interactive container by pressing `Ctrl+P` and `Ctrl+Q`.

### Running Minecraft on another port
The port where the Minecraft server is visible at your host machine depends on how you start the container (see also: [Docker Documentation](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p-expose)). By default port `25565` is used. Change the `<host-port>` statement from the command below to your desired port.
```
docker run -it --rm -v $PWD/server-data:/minecraft -p <host-port>:25565 --name minecraft minecraft
```

### Changing Minecraft version and the amount of RAM
You can adjust the amout of used memory for the Minecraft server in the `includes/entrypoint.sh` file. This is the same place where the Minecraft version can be changed.

## Updating
Updating the server...
1. Delete or rename the `server-data/BuildTools.jar` file (Want to know why? See `includes/entrypoint.sh`)
2. Change the Minecraft version numbers in the `includes/entrypoint.sh` file
3. Rebuild the container (`docker build -t minecraft .`)
4. Run the container (see chapter *Getting started*)

## Backup the data
The data of the server, like the worlds, players, ... is stored outside the container in the `server-data` folder. So it is easy to back up you data.
