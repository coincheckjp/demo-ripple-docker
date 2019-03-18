FROM node:10.15.3-alpine

WORKDIR /home/ripple-lib

RUN apk update && \
  apk add \
    bash \
    emacs \
    vim

COPY files .

RUN yarn

CMD ["node", "app.js"]
