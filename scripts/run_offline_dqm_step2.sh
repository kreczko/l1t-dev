#!/usr/bin/env bash
step2_inputFile=$1

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd ${PROJECTPATH}/${CMSSW_VERSION}/src
eval `/cvmfs/cms.cern.ch/common/scram runtime -sh`

echo "Running step 2 (DQM Harvesting)"
cmsRun \
DQMOffline/L1Trigger/test/runDQMOffline_step2_L1TStage2CaloLayer2_cfg.py \
inputFiles=${step2_inputFile}
