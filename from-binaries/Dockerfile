# Copyright ETSI 2018
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

FROM centos:7

MAINTAINER ETSI-CTI

LABEL description="Titan Docker Image"

ENV TERM=linux
ENV HOSTNAME docker-titan

ENV TITAN_URL=https://www.eclipse.org/downloads/download.php?file=/titan/ttcn3-6.3.pl0-linux64-gcc4.4-centos6.tgz\&r=1
ENV TITAN_ARCHIVE=ttcn3-6.3.pl0-linux64-gcc4.4-centos6.tgz

#RUN   apk update \
#  &&   apk add ca-certificates wget \
#  &&   update-ca-certificates    

RUN yum update

RUN yum install -y wget

RUN wget $TITAN_URL -O $TITAN_ARCHIVE
RUN mkdir /usr/share/ttcn3

RUN tar xzf $TITAN_ARCHIVE -C /usr/share/ttcn3
RUN rm $TITAN_ARCHIVE

RUN echo "export TTCN3_DIR=/usr/share/ttcn3" >> /etc/profile.d/titanenv.sh
RUN echo "export PATH=$PATH:/usr/share/ttcn3/bin" >> /etc/profile.d/titanenv.sh
RUN echo "docker-titan" > /etc/hostname

RUN source /etc/profile.d/titanenv.sh && ttcn3_compiler -v

# That's all Floks
