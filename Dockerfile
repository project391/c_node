FROM node:10-alpine

RUN \
  apk update && \
  apk upgrade && \
  apk add openjdk8 openssh git && \
  rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN \
  addgroup jenkins && \
  adduser -D jenkins -s /bin/sh -G jenkins && \
  chown -R jenkins:jenkins /home/jenkins && \
  echo "jenkins:jenkins" | chpasswd

RUN \
  ssh-keygen -A

RUN \
  set -x && \
  echo "UsePrivilegeSeparation no" >> /etc/ssh/sshd_config && \
  echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
  echo "AllowGroups jenkins" >> /etc/ssh/sshd_config

# Comment these lines to disable sudo
RUN \
  apk --update add sudo && \
  rm -rf /var/cache/apk/* && \
  echo "%jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

RUN \
  touch ~/.sudo_as_admin_successful

WORKDIR /home/jenkins

EXPOSE 22
CMD ["sudo", "/usr/sbin/sshd", "-D"]











#RUN mkdir -p /usr/src/app
#COPY package.json /usr/src/app/

#WORKDIR /usr/src/app
#RUN npm install --quiet
#COPY . /usr/src/app

#EXPOSE 4000

#CMD ["npm", "start"]

#ADD ./package.json /tmp/package.json
#RUN cd /tmp && npm install --quiet
#RUN mkdir -p /bin && cp -a /tmp/node_modules /bin
#WORKDIR /bin
#ADD . /bin

#RUN npm i express
#RUN npm i supertest should mocha
#RUN npm i -g mocha
#RUN npm i -g pm2


