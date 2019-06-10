FROM ubuntu:xenial
MAINTAINER Neblio <info@nebl.io>

COPY --from=neblioteam/nebliod-build:latest /bin/nebliod /bin/nebliod

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_init /usr/local/bin/run_neblio

EXPOSE 6325 6326

VOLUME /root/.neblio

CMD ["run_neblio"]