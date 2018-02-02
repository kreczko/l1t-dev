#!/usr/bin/env bash
sample=$1
step1_outputFile=$2
nevents=$3
echo "Running DQM Offline for ${sample}"

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd ${PROJECTPATH}/${CMSSW_VERSION}/src
eval `/cvmfs/cms.cern.ch/common/scram runtime -sh`

echo "Running step 1 (Filling histograms)"
cmsRun \
  DQMOffline/L1Trigger/test/runDQMOffline_step1_L1TStage2CaloLayer2_cfg.py \
  sample=${sample} \
  maxEvents=${nevents} \
  outputFile=${step1_outputFile}
