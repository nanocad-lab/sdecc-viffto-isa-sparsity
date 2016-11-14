#!/bin/csh -f
#  rv64g_sparsity_check.cmd
#
#  UGE job for rv64g_sparsity_check built Fri Nov 11 19:00:37 PST 2016
#
#  The following items pertain to this script
#  Use current working directory
#$ -cwd
#  input           = /dev/null
#  output          = /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID
#$ -o /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID
#  error           = Merged with joblog
#$ -j y
#  The following items pertain to the user program
#  user program    = /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.m
#  arguments       = -m
#  program input   = Specified by user program
#  program output  = Specified by user program
#  Resources requested
#
#$ -l h_data=5000M,h_rt=0:20:00
#
#  Name of application for log
#$ -v QQAPP=mcc
#  Email address to notify
#$ -M mgottsch@mail
#  Notify at beginning and end of job
#$ -m bea
#  Job is not rerunable
#$ -r n
#
# Initialization for serial execution
#
  unalias *
  set qqversion = 
  set qqapp     = "mcc serial"
  set qqidir    = /u/project/puneet/mgottsch/eccgrp-isa-sparsity
  set qqjob     = rv64g_sparsity_check
  set qqodir    = /u/project/puneet/mgottsch/eccgrp-isa-sparsity
  cd     /u/project/puneet/mgottsch/eccgrp-isa-sparsity
  source /u/local/bin/qq.sge/qr.runtime
  if ($status != 0) exit (1)
#
  echo "UGE job for rv64g_sparsity_check built Fri Nov 11 19:00:37 PST 2016"
  echo ""
  echo "  rv64g_sparsity_check directory:"
  echo "    "/u/project/puneet/mgottsch/eccgrp-isa-sparsity
  echo "  Submitted to UGE:"
  echo "    "$qqsubmit
  echo "  SCRATCH directory:"
  echo "    "$qqscratch
#
  echo ""
  echo "rv64g_sparsity_check started on:   "` hostname -s `
  echo "rv64g_sparsity_check started at:   "` date `
  echo ""
#
# Run the user program
#
  source /u/local/Modules/default/init/modules.csh	
  module load matlab
  setenv LM_LICENSE_FILE /u/local/licenses/license.matlab
  set path = ( $path /sbin )
#
  echo mcc rv64g_sparsity_check.m -m
requeue:
  /u/local/apps/matlab/8.6/bin/mcc rv64g_sparsity_check.m -m
  set rc = $status
#
# if( `grep -c 'Maximum number of users' /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID` > 0 || `grep -c 'License checkout failed' /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID` > 0 ) then
  if( `grep -c 'Maximum number of users' /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID` > 0 || `grep -c 'License checkout failed' /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID` > 0 || `grep -c 'Could not check out a Compiler license' /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID` > 0 ) then
    head -n 13 /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID > /u/project/puneet/mgottsch/eccgrp-isa-sparsity/.$$
    echo "------------ waiting for a license. retrying mcc command." >> /u/project/puneet/mgottsch/eccgrp-isa-sparsity/.$$
    sleep 90
    mv /u/project/puneet/mgottsch/eccgrp-isa-sparsity/.$$ /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID
    goto requeue
  endif
#
  echo ""
  if( $rc != 0 || ! -e /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check ) then
    echo ============================================================
    echo ERROR: mcc.queue failed with status $rc
    echo ============================================================
  endif
#
  echo ""
  echo "rv64g_sparsity_check finished at:  "` date `
#
# Cleanup after serial execution
#
  source /u/local/bin/qq.sge/qr.runtime
#
  echo "-------- /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID --------" >> /u/local/apps/queue.logs/mcc.log.serial
 if (`wc -l /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID  | awk '{print $1}'` >= 1000) then
        head -50 /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID >> /u/local/apps/queue.logs/mcc.log.serial
        echo " "  >> /u/local/apps/queue.logs/mcc.log.serial
        tail -10 /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID >> /u/local/apps/queue.logs/mcc.log.serial
  else
        cat /u/project/puneet/mgottsch/eccgrp-isa-sparsity/rv64g_sparsity_check.joblog.$JOB_ID >> /u/local/apps/queue.logs/mcc.log.serial
  endif
  exit (0)
