FROM alpine:3.7
LABEL maintainer="Gavin Lam <me@gavin.hk>"

ARG VERSION=v0.10.0
ARG VARIANT=linux_amd64
ARG URL=https://github.com/tcnksm/ghr/releases/download/${VERSION}/ghr_${VERSION}_${VARIANT}.tar.gz

RUN \
    # Prepare for download context directory
    mkdir /tmp/ghr_download && \
    cd /tmp/ghr_download && \
    # Download the tarball from Github
    wget ${URL} -O - | tar xz && \
    # Copy the binary and change owner
    cp ghr_${VERSION}_${VARIANT}/ghr /usr/local/bin/ghr && \
    chown root:root /usr/local/bin/ghr && \
    # Remove the download context directory
    rm -rf /tmp/ghr_download
