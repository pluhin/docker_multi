FROM centos:centos7.7.1908

RUN yum install epel-release git -y \
    && mkdir /download

VOLUME ["/download"]
