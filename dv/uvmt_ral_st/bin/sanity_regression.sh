#! /bin/bash
########################################################################################################################
## Copyright 2021-2022 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml_ral project sim dir
mio cpel    uvmt_ral_st -CE
mio sim     uvmt_ral_st -S -t front_door_access -s 1 -c
mio results uvmt_ral_st results
mio cov     uvmt_ral_st
