FROM debian:stretch
COPY ./jdk1.8.0_211 /opt/jdk8
RUN export LANG=zh_CN.UTF-8 && \
apt-get update \
 && apt-get install -y --no-install-recommends \
        xfonts-wqy \
        libfontconfig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /opt/jdk8
ENV PATH ${PATH}:${JAVA_HOME}/bin
