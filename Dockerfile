FROM node:6

RUN mkdir /explorer
COPY . /explorer
RUN chown -R node.node /explorer
USER node
RUN cd /explorer && npm install && npm run postinstall

WORKDIR /explorer
EXPOSE 8000
CMD ["npm","start"]