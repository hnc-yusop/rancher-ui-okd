FROM rancher/ui:build

EXPOSE 8000

WORKDIR /source
COPY package.json ./
COPY scripts ./scripts
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN yarn install && yarn cache clean
COPY . /source
ENTRYPOINT ["yarn"]
CMD ["start","--ssl=false"]
