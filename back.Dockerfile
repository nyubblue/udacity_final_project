FROM node:14-alpine

WORKDIR /app

# send resources to container
COPY artifact.tar.gz /app

RUN tar -xzf /app/artifact.tar.gz -C /app

EXPOSE 3030

RUN npm install pm2 -g
CMD pm2 start npm -- start