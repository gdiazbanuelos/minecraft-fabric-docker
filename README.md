# Docker Minecraft Fabric Server

Requirements
- Docker
- Docker compose

```
docker compose up -d --build
```
## Changing Fabric/Minecraft version
Refer to official Fabric server: https://fabricmc.net/use/server/

Copy the verion numbers for:
- Minecraft Version
- Fabric Loader Version
- Installer Version

Place the versions in the **compose.yml** under the environment section

## Github Actions build status
[![Run Server Deployment](https://github.com/gdiazbanuelos/minecraft-fabric-docker/actions/workflows/deploy-test.yml/badge.svg)](https://github.com/gdiazbanuelos/minecraft-fabric-docker/actions/workflows/deploy-test.yml)

