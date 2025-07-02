# Use official Node.js Alpine image
FROM node:18-alpine

WORKDIR /app

# Copy dependencies and install
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

EXPOSE 5000

# Start the app
CMD ["npm", "start"]


