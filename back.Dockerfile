FROM node:14

WORKDIR /app

# send resources to container
COPY artifact.tar.gz /app

RUN tar -xzf ~/web/artifact.tar.gz -C /app

EXPOSE 3030

CMD ["pm2-runtime", "main.ts"]