FROM hepsw/cvmfs-cms

ENV USERNAME cmsuser

RUN yum update -y -q && \
  yum install -y -q \
  git \
  glibc-devel \
  libXft \
  patch \
  sudo && \
  yum clean all

ARG USERID=1000

RUN adduser -u ${USERID} ${USERNAME} && \
  echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} && \
  chmod 0440 /etc/sudoers.d/${USERNAME} && \
  cp -p /root/.bashrc /home/${USERNAME}/.

RUN echo "export CMS_LOCAL_SITE=/cvmfs/cms.cern.ch/SITECONF/T3_UK_GridPP_Cloud" > /etc/cvmfs/config.d/cms.cern.ch.conf

COPY scripts /scripts
ENV PATH /scripts:$PATH

USER ${USERNAME}
ENV HOME /home/${USERNAME}

ENTRYPOINT sudo /usr/bin/cubied && \
  echo "Starting CMSSW container" && \
  tail -f /dev/null
