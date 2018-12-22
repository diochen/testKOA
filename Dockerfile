FROM node:10.14-alpine AS dev

RUN npm install pm2 -g

RUN mkdir -p /home/node-app

# Create app directory
WORKDIR /home/node-app

EXPOSE 3001
#CMD [ "npm", "start" ]
CMD [ "pm2-runtime", "app.js" ]



FROM dev

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 3001
CMD [ "npm", "start" ]