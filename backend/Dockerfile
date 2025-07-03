# Use official Node.js image
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Accept runtime environment variable
ENV MONGO_URI=""

EXPOSE 5000

CMD ["npm", "start"]



