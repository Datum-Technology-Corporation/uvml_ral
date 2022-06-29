#! /bin/bash
########################################################################################################################
## Copyright 2021 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
########################################################################################################################


# Launched from uvml project sim dir
python ./setup_project.py
source ./setup_terminal.sh
../tools/.imports/mio/src/__main__.py cpel uvmt_ral_st
../tools/.imports/mio/src/__main__.py sim uvmt_ral_st -t front_door_access -s 1 -c
../tools/.imports/mio/src/__main__.py results uvmt_ral_st results
../tools/.imports/mio/src/__main__.py cov uvmt_ral_st
