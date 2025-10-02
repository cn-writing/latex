FROM ubuntu:24.04
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

ENV TZ=Europe/London

# renovate: suite=stable depName=texlive-full
ENV TEXLIVE_VERSION="2023.20240207-1"

# renovate: suite=stable depName=latexmk
ENV LATEXMK_VERSION="1:4.83-1"

# renovate: suite=stable depName=biber
ENV BIBER_VERSION="2.19-2"

# renovate: suite=stable depName=chktex
ARG CHKTEX_VERSION="1.7.8-1"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y curl git make tzdata && \
    curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash && \
    apt update && \
    apt install -y task && \
    apt install -y texlive-full=${TEXLIVE_VERSION}* latexmk=${LATEXMK_VERSION}* biber=${BIBER_VERSION}* && \
    apt install -y chktex=${CHKTEX_VERSION} && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
