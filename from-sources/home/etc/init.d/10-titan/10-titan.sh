#!/bin/bash
echo -e "*****************************\n* Install titan\n*****************************\n"
SRC_DIR=${HOME}/src/titan
export TTCN3_DIR=${HOME}/frameworks/titan
[ -f /usr/bin/java ] &&  export JAVA_HOME=`readlink -f /usr/bin/java | sed "s:bin/java::"`
TITAN_REPO=`cat ${HOME}/etc/titan_repos.txt | grep 'titan\.core\.git' | head -n 1`
export PATH=$PATH:$TTCN3_DIR/bin

mkdir -p "$SRC_DIR"
cd "$SRC_DIR" || exit 1

echo "export TTCN3_DIR=${TTCN3_DIR}" >> ${HOME}/.bashrc
echo "export PATH=\${PATH}:\${TTCN3_DIR}/bin" >> ${HOME}/.bashrc

# Install titan core
git clone --progress ${TITAN_REPO} || exit 1

mkdir -p ${TTCN3_DIR}
cd titan.core || exit 1
cat >Makefile.personal <<EOF
TTCN3_DIR=$TTCN3_DIR
JNI=yes
GUI=yes
DEBUG=no
GEN_PDF=no
JDKDIR=$JAVA_HOME
EOF

make && make install || exit 1

# Install other repos
mkdir -p $TTCN3_DIR/../titan-modules
cd $TTCN3_DIR/../titan-modules || exit 1
cat ${HOME}/etc/titan_repos.txt | grep -v -e '^\s*#' -e 'titan\.core' | while read REPO; do
  [ -z $ ${REPO} ] && continue
  WS=`echo ${REPO} | sed -e 's|.*/||g' -e 's|\.git||g'`
  if git clone --progress "${REPO}" "${WS}"; then
    [ -f "${WS}/Makefile" ] && make -C "${WS}"
  fi
done

