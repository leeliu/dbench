FROM alpine

MAINTAINER Dmitry Monakhov dmonakhov@openvz.org

# Install build deps + permanent dep: libaio
RUN apk --no-cache add \
    	make \
    	alpine-sdk \
    	zlib-dev \
    	libaio-dev \
    	linux-headers \
	    coreutils \
      grep \
    	libaio && \
    git clone https://github.com/axboe/fio && \
    cd fio && \
    ./configure && \
    make -j`nproc` && \
    make install && \
    cd .. && \
    rm -rf fio && \
    apk --no-cache del \
    	make \
    	alpine-sdk \
    	zlib-dev \
    	libaio-dev \
    	linux-headers \
    	coreutils

VOLUME /tmp
WORKDIR /tmp
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
