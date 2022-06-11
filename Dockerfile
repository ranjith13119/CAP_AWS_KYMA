FROM node:14-alpine

RUN mkdir -p /app && \
    chown node.node /app

# Create app directory
WORKDIR /app

# Bundle app source
COPY . .
RUN npm install  --production

CMD [ "npm", "start" ]