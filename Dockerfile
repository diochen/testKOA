FROM node:10.13 AS dev

RUN mkdir -p /home/node-app

# Create app directory
WORKDIR /home/node-app

EXPOSE 3001
CMD [ "npm", "start" ]



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