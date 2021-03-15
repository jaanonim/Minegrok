# Docker-minecraft-with-ngrok
## Building docker-minecraft

Running this will build you a docker image with the latest version of both
docker-minecraft and Minecraft itself.

    docker build -t mingrok .
    docker run -d --name=mc -p 25565:25565 --env-file ./.env mingrok /start

Remamber to setup .env file.
## Notes on the run command

 + `-d` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p host_port:docker_port`
 + `-v` is the volume you are mounting `-v host_dir:docker_dir`

