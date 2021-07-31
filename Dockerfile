FROM nginx:latest

WORKDIR /source

COPY . /source

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install -y nodejs

RUN apt-get install -y git

RUN npm install --global yarn

RUN yarn install && yarn cache clean

RUN scripts/update-dependencies

RUN scripts/build-static -s -l -c 'your-server.com'

COPY ssl /rancher-ui/ssl

COPY rancher-ui.conf /etc/nginx/conf.d

COPY source/dist/static /rancher-ui/www
