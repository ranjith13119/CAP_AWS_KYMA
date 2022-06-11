FROM node:16

WORKDIR /usr/src/app
#this wildcard operator will ensures that both package.jsona and package-lock.json are copied
COPY /package*.json ./

RUN npm install 

#Bundle the app source
COPY /. .

EXPOSE 4004

CMD ["npm", "start"]