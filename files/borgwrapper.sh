#!/bin/sh

ARCHIVE=$1
JOBNAME=$2
SOURCE=$3
BACKUPDATE=$(date +%Y%m%d)

borg create "${ARCHIVE}::${BACKUPDATE}_${JOBNAME}" "${SOURCE}"
