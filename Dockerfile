FROM debian:latest

# Install Java, curl, unzip
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /server

# Default environment variables (overridable via docker-compose)
ENV MINECRAFT_VERSION=1.21.10 \
    FABRIC_LOADER_VERSION=0.18.1 \
    INSTALLER_VERSION=1.1.0 \
    MAX_MEMORY=4G

# Expose Minecraft port
EXPOSE 25565

# ENTRYPOINT: download jar if missing, write eula, launch server
ENTRYPOINT ["sh", "-c", "\
if [ ! -f /server/fabric-server-mc.${MINECRAFT_VERSION}-loader.${FABRIC_LOADER_VERSION}-launcher.${INSTALLER_VERSION}.jar ]; then \
    echo 'Downloading Fabric server jar...'; \
    curl -fSL -o /server/fabric-server-mc.${MINECRAFT_VERSION}-loader.${FABRIC_LOADER_VERSION}-launcher.${INSTALLER_VERSION}.jar \
        https://meta.fabricmc.net/v2/versions/loader/${MINECRAFT_VERSION}/${FABRIC_LOADER_VERSION}/${INSTALLER_VERSION}/server/jar; \
fi; \
[ ! -f /server/eula.txt ] && echo 'eula=true' > /server/eula.txt; \
echo 'Starting Minecraft server...'; \
exec java -Xmx${MAX_MEMORY} -jar /server/fabric-server-mc.${MINECRAFT_VERSION}-loader.${FABRIC_LOADER_VERSION}-launcher.${INSTALLER_VERSION}.jar nogui \
"]
