#!/usr/bin/env bash

export CVMFS_TMP_DIR=/tmp/cvmfs-l1t
export L1T_DEV_DIR=$PWD/dev
export USERID=`id -u`
export CMSSW_VERSION="CMSSW_10_0_0"
export SCRAM_ARCH="slc6_amd64_gcc630"

mkdir -p ${CVMFS_TMP_DIR}
mkdir -p ${L1T_DEV_DIR}/data
mkdir -p ${L1T_DEV_DIR}/external
mkdir -p ${L1T_DEV_DIR}/workspace
