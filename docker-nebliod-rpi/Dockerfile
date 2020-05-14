FROM balenalib/raspberry-pi-debian:stretch
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

COPY --from=neblioteam/nebliod-build-rpi:latest /bin/nebliod /bin/nebliod

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_init /usr/local/bin/run_neblio

EXPOSE 6325 6326

VOLUME /root/.neblio

CMD ["run_neblio"]

RUN [ "cross-build-end" ]