FROM node:10.23.0-alpine
WORKDIR /app

COPY . .
RUN npm install

RUN npm install sequelize-cli -g

RUN npm install pm2 -g

RUN sequelize db:migrate

EXPOSE 5000

COPY . .

CMD [ "pm2-runtime", "server.js" ]
