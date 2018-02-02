#!/bin/bash
echo " >> Setting up DQM Offline"

mkdir -p ${PROJECTPATH}
cd ${PROJECTPATH}
source /cvmfs/cms.cern.ch/cmsset_default.sh

if [ ! -d ${PROJECTPATH}/${CMSSW_VERSION} ]
then
  echo " >> Creating CMSSW area for ${CMSSW_VERSION}"
  scram p ${CMSSW_VERSION}
fi
pushd ${CMSSW_VERSION}/src
eval `/cvmfs/cms.cern.ch/common/scram runtime -sh`

if [ ! -d DQMOffline/L1Trigger ]
then
  echo " >> Adding DQMOffline/L1Trigger"
  git cms-addpkg DQMOffline/L1Trigger
fi
popd

echo "Finished setup"
