FROM node:4.4.5

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.10.5

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/chat/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/chat
RUN npm install

CMD ["node", "index.js"]
