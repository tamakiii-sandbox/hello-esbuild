FROM --platform=linux/x86_64 amazonlinux:2.0.20220912.1

RUN yum update -y && \
    yum install -y \
      which \
      make \
      golang \
      && \
    yum clean all && \
    rm -rf /var/cache/yum/*
