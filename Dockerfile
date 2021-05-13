FROM alpine:latest

COPY bitflu.config bitflu.config

RUN apk add --no-cache \
  curl tar make gcc build-base wget gnupg git \
  perl perl-dev perl-app-cpanminus \
  && cpanm Danga::Socket \
  && cpanm Digest::SHA1 \
  && apk del make gcc build-base gnupg

RUN git clone https://github.com/adrian-bl/bitflu.git \
  && mkdir -p /bitflu/workdir/ \
  && mv /bitflu.config /bitflu/.bitflu.config \
  && addgroup -S bitflu && adduser -S bitflu -G bitflu \
  && chown -R bitflu:bitflu /bitflu \
  && apk del curl tar wget git

USER bitflu:bitflu

# Local command port
EXPOSE 4001
# Local WebUI port
EXPOSE 4081
# Torrent peer ports
EXPOSE 6688/tcp
EXPOSE 6688/udp
EXPOSE 6881/tcp
EXPOSE 6881/udp

VOLUME /bitflu/workdir
WORKDIR /bitflu

CMD perl /bitflu/bitflu.pl


# Add https://github.com/Rexypoo/docker-entrypoint-helper/blob/master/entrypoint-helper.sh
