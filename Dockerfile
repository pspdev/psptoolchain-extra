ARG BASE_DOCKER_IMAGE

FROM $BASE_DOCKER_IMAGE

COPY . /src

RUN apk add build-base bash git autoconf automake python3 py3-pip cmake pkgconfig libarchive-dev openssl-dev gpgme-dev libtool
RUN cd /src && ./build-all.sh

# Second stage of Dockerfile
FROM alpine:latest

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:${PSPDEV}/bin

COPY --from=0 ${PSPDEV} ${PSPDEV}
