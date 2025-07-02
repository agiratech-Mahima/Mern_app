FROM node:18-alpine AS build

WORKDIR /app

# Copy only package.json first (for caching)
COPY src/package*.json ./

RUN npm install

# Copy the rest of the frontend code
COPY src/ .

RUN npm run build

# Use Nginx to serve build
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

