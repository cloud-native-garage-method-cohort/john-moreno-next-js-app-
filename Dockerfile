# Multistep image build that builds the app and then copies the static rendered pages for serving 
# them using nginx. This reduces the app size by a lot when compared to using a node server

# Install dependencies and build the app
FROM node:16.10-alpine3.13
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]