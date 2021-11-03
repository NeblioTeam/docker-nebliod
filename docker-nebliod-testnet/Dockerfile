FROM ubuntu:xenial
MAINTAINER Neblio <info@nebl.io>

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates

COPY --from=neblioteam/nebliod-build:latest /bin/nebliod /bin/nebliod

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_init /usr/local/bin/run_neblio

EXPOSE 16325 16326

VOLUME /root/.neblio

CMD ["run_neblio"]