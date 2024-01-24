FROM ubuntu:22.04
FROM mcr.microsoft.com/dotnet/runtime:7.0

RUN apt-get update 
RUN apt-get install -y nano tzdata wget unzip htop

RUN mkdir -p /opt/app/rimworld-server
WORKDIR /opt/app/rimworld-server/

### RimWorld-Together
RUN wget https://github.com/Nova-Atomic/Rimworld-Together/releases/download/1.1.1/Linux-x64.zip -P /opt/app/rimworld-server && \
    unzip Linux-x64.zip && \
    rm Linux-x64.zip && \
    chmod +777 GameServer

EXPOSE 25555/TCP
CMD [ "./GameServer" ]
