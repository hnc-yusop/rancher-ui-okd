#FROM nginx:latest
#
#COPY ssl /rancher-ui/ssl
#
#COPY rancher-ui.conf /etc/nginx/conf.d
#
#COPY /dist/static /rancher-ui/www

FROM gcc:latest as BUILD
WORKDIR /usr/src/app
COPY . .
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs git
RUN npm install --global yarn
RUN yarn install && yarn cache clean
RUN ./scripts/update-dependencies
RUN git checkout Dockerfile
RUN ./scripts/build-static -s -l -v'rancher-ui' -c 'af0d5015fb27e42bd89310d1c1d361bb-1043022258.ap-northeast-2.elb.amazonaws.com:8000'

FROM nginx:1.17
COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY --from=BUILD /usr/src/app/dist/static .
EXPOSE 8000:8000
CMD ["nginx", "-g", "daemon off;"]
