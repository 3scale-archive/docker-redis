FROM debian:jessie

MAINTAINER Michal Cichra <michal@3scale.net> # 2014-05-23

VOLUME ["/data/"]
WORKDIR /data

RUN apt-get -y -q install redis-server \
 && ln -sf /data /var/lib/redis \
 && apt-get -q -y clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD redis.conf /etc/redis/

EXPOSE 6379/tcp

CMD ["redis-server"]

