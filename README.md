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
**1. Change directory to 'sim'**

This is from where all jobs will be launched.
```
cd ./sim
```

**2. Project Setup**

Only needs to be done once, or when libraries must be updated. This will pull in dependencies from the web.
```
./setup_project.py
```

**3. Terminal Setup**

This must be done per terminal. The script included in this project is for bash:

```
export VIVADO=/path/to/vivado/bin # Set locaton of Vivado installation
source ./setup_terminal.sh
```

**4. Launch**

All jobs for simulation are performed via `dvm`.

> At any time, you can invoke its built-in documentation:

```
dvm --help
```

> To run test 'front_door' with seed '1' and wave capture enabled:


```
clear && dvm all uvmt_ral_st -t front_door -s 1 -w 1
```
