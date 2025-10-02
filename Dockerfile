FROM ubuntu:24.04
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y curl git make tzdata && \
    curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash && \
    apt update && \
    apt install -y task texlive-full latexmk biber chktex && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
