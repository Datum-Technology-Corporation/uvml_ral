#! /bin/bash
########################################################################################################################
## Copyright 2021 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml_ral project sim dir
shopt -s expand_aliases
source ~/.bashrc
mio cpel    uvmt_ral_st
mio sim     uvmt_ral_st -t front_door_access -s 1 -c
mio results uvmt_ral_st results
mio cov     uvmt_ral_st
