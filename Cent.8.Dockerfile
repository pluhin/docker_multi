FROM centos:centos8

RUN dnf install dnf-plugins-core -y \
    &&  dnf install epel-release -y \
    && mkdir /download

VOLUME ["/download"]
