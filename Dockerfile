FROM ubuntu:18.04

ARG rippled_ver=1.2.2
ARG network=testnet

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y yum-utils alien

RUN rpm -Uvh https://mirrors.ripple.com/ripple-repo-el7.rpm

RUN yumdownloader --enablerepo=ripple-stable --releasever=el7 rippled-${rippled_ver}

RUN \
  rpm --import https://mirrors.ripple.com/rpm/RPM-GPG-KEY-ripple-release && \
  rpm -K rippled-${rippled_ver}*.rpm && \
  alien -i --scripts rippled-${rippled_ver}*.rpm && \
  rm rippled-${rippled_ver}*.rpm

RUN cp /opt/ripple/bin/rippled /usr/local/bin/

# Config files
COPY ${network}/rippled.cfg /opt/ripple/etc
COPY ${network}/validators.txt /opt/ripple/etc

CMD [ "rippled", "--conf", "/opt/ripple/etc/rippled.cfg" ]
