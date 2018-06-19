# Copyright ETSI 2018
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

FROM gcc:latest

MAINTAINER ETSI-CTI

LABEL description="Titan Docker Image"

ENV TERM=linux
ENV HOSTNAME docker-titan

RUN echo "docker-titan" > /etc/hostname
RUN DEBIAN_FRONTEND=noninteractive apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y 
# RUN DEBIAN_FRONTEND=noninteractive apt-get autoremove -y 
# RUN DEBIAN_FRONTEND=noninteractive apt-get autoclean -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
      autoconf \
      bison \
      build-essential \
      cmake \
      curl \
      doxygen \
      emacs \
      expect \
      flex \
      gdb \ 
      git-core \
      gnutls-bin \
      libglib2.0-dev \
      libpcap-dev \
      libgcrypt-dev \
      libncurses5-dev \
      libssl-dev \
      libxml2-dev \
      pkg-config \
      sudo \
      sshpass \
      unzip \
      wget \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get autoclean -y

ADD scripts/devenv.bash.ubuntu /home/root/devenv.bash
ADD scripts/build_titan.bash /opt/titan-build/dev/build_titan.bash
RUN chmod +x /opt/titan-build/dev/build_titan.bash

ADD scripts/titan_repos.txt /opt/titan-build/dev/titan_repos.txt

RUN mkdir -p /opt/titan-build   
RUN cd /opt/titan-build \
    && mkdir -p bin lib include dev tmp frameworks docs 

RUN cd /home/root \
    && export TITAN_HOME=/home/root \
    && echo "---- RUNNING devenv.bash" \
    && . /home/root/devenv.bash \
    && echo "" >> /home/root/.bashrc \
    && echo "---- RUNNING devenv.bash  and adding it to bashrc" \
    && echo ". ./devenv.bash" >> /home/root/.bashrc \
    && echo "" >> /home/root/.bashrc \
    && echo "----  Compiling" \
    && cd /opt/titan-build/dev \
    && TOP=$(pwd) ./build_titan.bash

RUN . /home/root/devenv.bash

# RUN ttcn3_compiler -v

CMD bash

# That's all Floks
