FROM centos:centos6.8

RUN yum install epel-release -y \
    && yum makecache \
    && mkdir /download

VOLUME ["/download"]
