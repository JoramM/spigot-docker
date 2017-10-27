# A (Spigot) Minecraft Server with Docker

```
docker build -t minecraft .
docker run -it --rm -v $PWD/server-data:/minecraft --name minecraft minecraft
```
