# This is based on the work done by Michael Chiang <mchiang@docker.com> on
# https://github.com/kitematic/minecraft/blob/master/Dockerfile and modified for
# use in UnRAID.

FROM debian:stretch
MAINTAINER Harry Webster <me@harrywebster.com>
ENV MINECRAFT_UTILITY https://github.com/marblenix/minecraft_downloader/releases/download/latest/minecraft_downloader_linux
ENV MINECRAFT_VERSION latest
RUN apt update; \
    apt install -y default-jre ca-certificates-java curl; \
    curl -sL "${MINECRAFT_UTILITY}" -o minecraft_downloader; \
    chmod +x ./minecraft_downloader; \
    ./minecraft_downloader -o minecraft_server_${MINECRAFT_VERSION}.jar;

WORKDIR /data
EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -jar /minecraft_server_${MINECRAFT_VERSION}.jar
