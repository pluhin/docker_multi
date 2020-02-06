FROM centos:centos7.4.1708

RUN yum install epel-release git -y \
    && mkdir /download

VOLUME ["/download"]
