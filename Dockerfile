FROM nginx:latest

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install -y nodejs

RUN npm install --global yarn

RUN yarn install && yarn cache clean

RUN scripts/update-dependencies

COPY ssl /rancher-ui/ssl

COPY rancher-ui.conf /etc/nginx/conf.d

COPY dist/static /rancher-ui/www
