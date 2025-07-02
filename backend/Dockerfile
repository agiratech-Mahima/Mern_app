# Use official Node.js image
FROM node:18-alpine

# Accept build-time argument
ARG MONGO_URI

# Set environment variable for runtime
ENV MONGO_URI=$MONGO_URI

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "start"]

