FROM node:16.16.0
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm install
RUN ./node_modules/.bin/parcel build bundles-src/index.js --dist-dir bundles --public-url="./"
