FROM phusion/baseimage:latest

MAINTAINER Logan Hollins

RUN apt-get update

RUN apt-get install -y git

ENV NVM_SYMLINK_CURRENT true
ENV PATH=$PATH:/usr/share/nvm/current/bin
RUN git clone https://github.com/creationix/nvm.git /usr/share/nvm && cd /usr/share/nvm && git checkout `git describe --abbrev=0 --tags`
RUN echo '. /usr/share/nvm/nvm.sh' >> /root/.bashrc

RUN bash -c '. /usr/share/nvm/nvm.sh && nvm install 0.12.7 && nvm install stable'

RUN npm install ember-cli -g

RUN npm install bower -g

WORKDIR /root/app

ENTRYPOINT ["ember", "s"]
