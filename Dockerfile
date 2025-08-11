FROM ubuntu:24.04
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

ENV TZ=Europe/London

# renovate: datasource=repology depName=ubuntu_22_04/texlive-full versioning=loose
ENV TEXLIVE_VERSION="2021.20220204-1"
# renovate: datasource=repology depName=ubuntu_22_04/latexmk versioning=loose
ENV LATEXMK_VERSION="1:4.76-1"
# renovate: datasource=repology depName=ubuntu_22_04/biber versioning=loose
ENV BIBER_VERSION="2.17-2"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && \
    apt-get install -y tzdata make texlive-full=${TEXLIVE_VERSION}* latexmk=${LATEXMK_VERSION}* biber=${BIBER_VERSION}* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
