FROM phusion/baseimage:latest

MAINTAINER Logan Hollins

RUN apt-get update

RUN apt-get install -y nodejs-legacy npm git

RUN npm install -g npm@latest-2

WORKDIR /root

RUN npm install ember-cli -g

RUN npm install bower -g

WORKDIR /root
