FROM centos:centos8.1.1911 

RUN yum install epel-release -y \
    && mkdir /download

VOLUME ["/download"]
