# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
# -----------------------------------------------------------------------------

# Base image is the latest LTS version of Ubuntu
FROM   ubuntu:18.04

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN    apt-get -y update; apt-get -y upgrade; apt-get -y install software-properties-common curl default-jdk
RUN    apt-add-repository -y ppa:webupd8team/java; apt-get -y update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java8-installer ; apt-get clean

# Load in all of our config files.
ADD    ./scripts/start /start
ADD    ./ngrok/ngrok /bin/ngrok
ADD	./server /data

# Fix all permissions
RUN    chmod +x /start

# 25565 is for minecraft
EXPOSE 25565

# /data contains static files and database
VOLUME ["/data"]

# /start runs it.
CMD    ["/start"]
