FROM node:20-alpine

RUN apk add --no-cache sudo vim wget nano bash

RUN adduser -D -h /home/docker -s /bin/bash docker \
    && echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
