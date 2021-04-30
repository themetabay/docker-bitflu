FROM perl:latest

COPY bitflu.config bitflu.config

RUN useradd -ms /bin/bash bitflu \
  && cpanm Danga::Socket \
  && cpanm Digest::SHA1

RUN git clone https://github.com/adrian-bl/bitflu.git \
  && mkdir -p /bitflu/workdir/ \
  && mv /bitflu.config /bitflu/.bitflu.config \
  && chown -R bitflu:bitflu /bitflu

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
