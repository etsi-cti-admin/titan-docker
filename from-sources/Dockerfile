# Copyright ETSI 2018
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

FROM gcc:latest

MAINTAINER ETSI-CTI

LABEL description="Titan Docker Image"

ENV TERM=linux \
    HOSTNAME=docker-STF \
    HOME=/home/etsi

USER etsi

COPY home /home/etsi

RUN cd ${HOME} \
    && export PATH=${HOME}/bin:${PATH} \
    && export LD_LIBRARY_PATH=${HOME}/lib:${LD_LIBRARY_PATH} \
    && ls ${HOME}/etc/init.d/*.sh | while read S; do chmod 0750 "$S"; /bin/bash -c "$S" || exit 1; done

CMD ["/bin/bash"]

# That's all Floks
