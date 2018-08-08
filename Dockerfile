FROM dmonakhov/alpine-fio

MAINTAINER Lee Liu <lee@logdna.com>

VOLUME /tmp
WORKDIR /tmp
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
