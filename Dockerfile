# ---- Build Stage ----
FROM node:18-alpine AS build

WORKDIR /app

# Copy only necessary files for install
COPY package*.json ./
COPY public/ ./public/
COPY src/ ./src/

RUN npm install
RUN npm run build

# ---- Production Stage ----
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY ../default.conf /etc/nginx/conf.d/default.conf


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


