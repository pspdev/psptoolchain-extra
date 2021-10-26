ARG BASE_DOCKER_IMAGE

FROM $BASE_DOCKER_IMAGE

COPY . /src

RUN apk add build-base bash git python3 py3-pip cmake m4 pkgconfig libarchive-tools libarchive-dev openssl-dev gpgme-dev \
    curl-dev asciidoc asciidoctor autoconf automake libtool
RUN cd /src && ./build-all.sh

# Second stage of Dockerfile
FROM alpine:latest

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:${PSPDEV}/bin

COPY --from=0 ${PSPDEV} ${PSPDEV}
