# Copyright ETSI 2018
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

FROM centos:7

MAINTAINER ETSI-CTI

LABEL description="Titan Docker Image"

ENV TERM=linux
ENV HOSTNAME docker-titan

ENV TITAN_URL=https://www.eclipse.org/downloads/download.php?file=/titan/ttcn3-6.3.pl0-linux64-gcc4.4-centos6.tgz\&r=1
ENV TITAN_ARCHIVE=ttcn3-6.3.pl0-linux64-gcc4.4-centos6.tgz

RUN yum install -y wget
RUN yum groupinstall -y 'Development Tools'
RUN yum -y install libxml2 libxml2-devel openssl-devel

RUN wget $TITAN_URL -O $TITAN_ARCHIVE
RUN mkdir /usr/share/ttcn3

RUN tar xzf $TITAN_ARCHIVE -C /usr/share/ttcn3
RUN rm $TITAN_ARCHIVE

RUN echo '/* Check if the compiler matches the one used to build the runtime */ \
#ifndef MAKEDEPEND_RUN \
#if GCC_VERSION != 40400 \
#error The version of GCC does not match the expected version (GCC 4.4.7) \
#endif \
#endif \
' > /usr/share/ttcn3/include/cversion.h

RUN echo "export TTCN3_DIR=/usr/share/ttcn3" >> /etc/profile.d/titanenv.sh
RUN echo "export PATH=$PATH:/usr/share/ttcn3/bin" >> /etc/profile.d/titanenv.sh
RUN echo "docker-titan" > /etc/hostname

RUN source /etc/profile.d/titanenv.sh && ttcn3_compiler -v

# That's all Floks
