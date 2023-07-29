FROM node:14

WORKDIR /app

# send resources to container
COPY artifact.tar.gz ~/web/

RUN npm install
RUN tar -xzf ~/web/artifact.tar.gz -C ~/web

EXPOSE 3030

CMD ["pm2-runtime", "main.ts"]