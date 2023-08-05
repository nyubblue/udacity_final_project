FROM circleci/node:13.8.0

WORKDIR /app

# send resources to container
COPY artifact.tar.gz /app

RUN tar -xzf /app/artifact.tar.gz -C /app

EXPOSE 3030

RUN npm install
RUN pm2 stop default
RUN pm2 start npm -- start
#CMD ["pm2-runtime", "main.ts"]