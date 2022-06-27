FROM centos:8

RUN yum install epel-release git -y \
    && yum makecache \
    && mkdir /download

VOLUME ["/download"]
