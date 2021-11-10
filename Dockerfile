# First stage
FROM alpine:latest

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:${PSPDEV}/bin

COPY . /src

RUN apk add build-base bash git autoconf automake python3 py3-pip cmake pkgconfig libarchive-dev openssl-dev libtool
RUN cd /src && ./build-all.sh

# Second stage of Dockerfile
FROM alpine:latest

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:${PSPDEV}/bin

COPY --from=0 ${PSPDEV} ${PSPDEV}
