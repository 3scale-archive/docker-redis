FROM quay.io/3scale/base:trusty

MAINTAINER Michal Cichra <michal@3scale.net> # 2014-05-23

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 136221EE520DDFAF0A905689B9316A7BC7917B12 \
 && echo 'deb http://ppa.launchpad.net/chris-lea/redis-server/ubuntu trusty main' > /etc/apt/sources.list.d/redis-server.list

RUN apt-install redis-server

ADD redis.conf /etc/redis/

RUN chown redis /etc/redis/*

USER redis

EXPOSE 6379/tcp

ENTRYPOINT ["redis-server"]
CMD ["/etc/redis/redis.conf"]
