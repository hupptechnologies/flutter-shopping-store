FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

RUN npm run build
RUN npm run seed

EXPOSE 3000

CMD ["npm", "run", "start"]
