ARG NODE_TAG=lts-slim

FROM node:$NODE_TAG

RUN apt-get -qq -y update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends \
  git \
  openssh-client \
  tini \
  && rm -rf /var/lib/apt/lists/* \
  && npm i -g npm@latest

ENTRYPOINT ["/usr/bin/tini", "--"]

USER node
