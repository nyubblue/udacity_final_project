FROM node:14

WORKDIR /app

# send resources to container
COPY artifact.tar.gz /app

RUN tar -xzf /app/artifact.tar.gz -C /app

EXPOSE 3030

RUN npm install
RUN npm install pm2 -g
RUN pm2 stop default
RUN pm2 start npm -- start