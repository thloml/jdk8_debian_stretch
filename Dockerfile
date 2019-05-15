FROM debian:stretch
ENV TZ=Asia/Shanghai
COPY ./jdk8.tar.gz /data/
COPY ./fonts/* /usr/share/fonts/
RUN tar -zxf /data/jdk8.tar.gz -C /opt/ && \
    rm -f /data/jdk8.tar.gz && \
    export LANG=zh_CN.UTF-8 && \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        xfonts-wqy \
        fontconfig \
 && fc-cache -vf \
 && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /opt/jdk1.8.0_211
ENV PATH ${PATH}:${JAVA_HOME}/bin
