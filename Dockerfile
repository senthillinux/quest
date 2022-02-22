FROM node:10
MAINTAINER "Senthil Kumar"
ENV SECRET_WORD=secret_word
ADD quest /app
WORKDIR /app
RUN npm install
CMD ["npm", "start"]

