FROM ubuntu

MAINTAINER Lee Liu <lee@logdna.com>

RUN apt-get update && apt-get install -y \
    fio

VOLUME /tmp
WORKDIR /tmp
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
