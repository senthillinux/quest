#! /bin/bash
sudo apt-get update
sudo wget -qO- https://get.docker.com/ | sh -
sudo cd /usr/local/
sudo git clone https://github.com/rearc/quest.git /usr/local/quest
sudo cat << \EOT > /usr/local/Dockerfile
FROM node:10
MAINTAINER "Senthil Kumar"
ENV SECRET_WORD=secret_word
ADD quest /app
WORKDIR /app
RUN npm install
CMD ["npm", "start"]
EOT
sudo docker build -t quest /usr/local/
sudo docker run -itd --name quest -p 3000:3000 quest
