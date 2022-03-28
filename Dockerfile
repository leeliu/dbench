FROM dmonakhov/alpine-fio

MAINTAINER Lee Liu <lee@logdna.com>, Hoon Jo <pagaia@hotmail.com>

# add due to grep -P doesn't support on alpine
apk add --no-cache --upgrade grep

VOLUME /tmp
WORKDIR /tmp
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
