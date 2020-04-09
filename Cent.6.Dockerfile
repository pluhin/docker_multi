FROM centos:centos6.9

RUN yum install epel-release -y \
    && mkdir /download

VOLUME ["/download"]
