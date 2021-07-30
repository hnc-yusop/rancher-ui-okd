FROM nginx:latest

COPY ssl /rancher-ui/ssl

<<<<<<< HEAD
COPY rancher-ui.conf /etc/nginx/conf.d

COPY dist/static /rancher-ui/www
=======
WORKDIR /source
COPY package.json ./
COPY scripts ./scripts
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN yarn install && yarn cache clean
COPY . /source
ENTRYPOINT ["yarn"]
CMD ["start","--ssl=true"]
>>>>>>> de8e5baf631bb37f4fa26a6b47e06589aa9f2eb5
