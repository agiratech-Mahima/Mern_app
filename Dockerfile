FROM node:18-alpine AS build

WORKDIR /app

COPY src/package*.json ./
RUN npm install

COPY src/ ./
RUN npm run build

# Serve build with nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
