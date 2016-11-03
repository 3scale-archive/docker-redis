FROM centos:7

RUN useradd -u 1001 -r -g 0 -d /data -s /sbin/nologin redis && \
    rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum install -y epel-release && \
    yum install -y redis && \
    yum clean all -y && \
    mkdir -p /data && \
    chgrp -v 0 /data && \
    chmod -v g+w /data

COPY redis.conf /etc/

USER 1001

VOLUME /data

ENTRYPOINT ["redis-server"]
CMD ["/etc/redis.conf"]
EXPOSE 6379/tcp
