# A (Spigot) Minecraft Server with Docker

```
docker build -t minecraft .
docker run -it --rm -v $PWD/server-data:/minecraft -p 25565:25565 --name minecraft minecraft
```
Run the container in detached mode.
```
docker run -it -d --rm -v $PWD/server-data:/minecraft -p 25565:25565 --name minecraft minecraft
```
