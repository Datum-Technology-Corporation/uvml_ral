# About
## [Home Page](https://datum-technology-corporation.github.io/uvml_ral/)
The Moore.io UVM Register Abstraction Layer Extensions Library is an excellent base on which to build your register models.  This project consists of the library itself (`uvml_ral_pkg`), the self-test UVM environment (`uvme_ral_st`) and the self-test UVM Test bench (`uvmt_ral_st`).

## IP
* DV
> * uvml_ral
> * uvme_ral_st
> * uvmt_ral_st
* RTL
* Tools


# Simulation
```
cd ./sim
cat ./README.md
./setup_project.py
source ./setup_terminal.sh
export VIVADO=/path/to/vivado/install
dvm --help
clear && dvm cmp uvml_ral
```
