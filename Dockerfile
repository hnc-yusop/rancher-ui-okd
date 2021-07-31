FROM nginx:latest

COPY . .

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install -y nodejs

RUN apt-get install -y git

RUN npm install --global yarn

RUN yarn install && yarn cache clean

RUN scripts/update-dependencies

RUN scripts/build-static -l -c 'your-server.com'

COPY ssl /rancher-ui/ssl

COPY rancher-ui.conf /etc/nginx/conf.d

COPY dist/static /rancher-ui/www
