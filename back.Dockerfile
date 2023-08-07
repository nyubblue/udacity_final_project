FROM ubuntu:latest

WORKDIR /app

# send resources to container
COPY artifact.tar.gz /app

RUN tar -xzf /app/artifact.tar.gz -C /app

RUN apt-get update
RUN apt-get install -y nodejs npm

RUN npm install pm2 -g
RUN npm install
EXPOSE 3030
RUN pm2 show default && pm2 stop default || true
CMD ["pm2", "start", "npm", "--", "start"]