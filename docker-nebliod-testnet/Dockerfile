FROM neblioteam/nebliod-sync-testnet
MAINTAINER Neblio <info@nebl.io>

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_init /usr/local/bin/run_neblio

EXPOSE 16325 16326

VOLUME /root/.neblio

CMD ["run_neblio"]