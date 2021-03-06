#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Dec 04 20:54:01 -03 2018
# SW Build 2348494 on Mon Oct  1 18:25:39 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xsim deco_tb_behav -key {Behavioral:sim_1:Functional:deco_tb} -tclbatch deco_tb.tcl -view /media/lu/Data/FACU/ARQUITECTURA/PRACTICOS/2018/TP3/TP3v2/deco_tb_behav.wcfg -log simulate.log
