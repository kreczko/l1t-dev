#!/usr/bin/env bash
sample=$1
step1_outputFile="L1TOffline_L1TStage2CaloLayer2_job1_RAW2DIGI_RECO_DQM_${sample}.root"
nevents=2000
echo "Running DQM Offline for ${sample}"

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd ${PROJECTPATH}/${CMSSW_VERSION}/src
eval `/cvmfs/cms.cern.ch/common/scram runtime -sh`
scram b -j4 &> tee compile.log

if [ $? == 0 ]
then
  source /scripts/run_offline_dqm_step1.sh $sample $step1_outputFile $nevents
else
  echo "Could not compile code, aborting!"
fi

if [ $? == 0 ]
then
    # Due to the automatic addition of 'numEventsX' to the output file name
  # we have to adjust
  step2_inputFile=`echo ${step1_outputFile} | sed -e 's/.root/*.root/g'`
  step2_inputFile=`echo ${step2_inputFile}`
  source /scripts/run_offline_dqm_step2.sh $step2_inputFile
else
  echo "Could not run step 1, aborting!"
fi
