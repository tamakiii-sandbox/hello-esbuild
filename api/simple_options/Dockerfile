FROM --platform=linux/x86_64 amazonlinux:2.0.20220912.1

RUN curl --silent --location https://rpm.nodesource.com/setup_16.x | bash -

RUN yum update -y && \
    yum install -y \
      which \
      make \
      glibc \
      nodejs \
      && \
    yum clean all && \
    rm -rf /var/cache/yum/*

