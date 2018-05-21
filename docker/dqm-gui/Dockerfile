FROM kreczko/centos6

RUN yum update -y -q && yum install -y -q \
  compat-libstdc++-33 \
  compat-readline5 \
  e2fsprogs \
  e2fsprogs-libs \
  fontconfig \
  freetype \
  git \
  hostname \
  mesa-libGL \
  mesa-libGLU \
  perl-ExtUtils-Embed \
  libICE \
  libSM \
  libX11 \
  libXcursor \
  libXext \
  libXft \
  libXi \
  libXinerama \
  libXmu \
  libXpm \
  libXrandr \
  libXrender \
  tcl \
  tcsh \
  tk \
  zsh \
  && yum clean all -y

ENV INSTALL_DIR=/data/srv
ENV CODE_DIR /tmp/code
ENV DQM_TAG='HG1610a'
ENV SCRAM_ARCH='slc6_amd64_gcc493'

EXPOSE 8060

ARG USERID=1000
RUN useradd -u ${USERID} dqmgui && \
    install -o dqmgui -d /data

USER dqmgui
RUN mkdir -p ${INSTALL_DIR}

RUN git clone git://github.com/dmwm/deployment.git ${CODE_DIR} \
 && cd ${CODE_DIR} \
 && git reset --hard ${DQM_TAG} \
 && ${CODE_DIR}/Deploy -r "comp=comp.pre" -A ${SCRAM_ARCH} -R comp@${DQM_TAG} -t ${DQM_TAG} -s "prep sw post" ${INSTALL_DIR} dqmgui/bare \
 && rm -fr ${INSTALL_DIR}/current/config/dqmgui \
 && cp -rp ${CODE_DIR}/dqmgui ${INSTALL_DIR}/current/config/. \
 && rm -fr ${CODE_DIR}

VOLUME /data/srv

CMD source ${INSTALL_DIR}/current/*/*/external/apt/*/etc/profile.d/init.sh && \
    ${INSTALL_DIR}/current/config/dqmgui/manage restart 'I did read documentation' && \
    sleep 60 && \
    tail -f ${INSTALL_DIR}/logs/dqmgui/dev/collector-*.log
