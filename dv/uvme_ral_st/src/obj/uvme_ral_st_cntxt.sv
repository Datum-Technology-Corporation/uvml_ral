// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_CNTXT_SV__
`define __UVME_RAL_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for the Moore.io Register Abstraction Layer UVM Extensions Self-Testing
 * Environment (uvme_ral_st_env_c) components.
 */
class uvme_ral_st_cntxt_c extends uvml_cntxt_c;
   
   // Events
   uvm_event  sample_cfg_e  ;
   uvm_event  sample_cntxt_e;
   
   
   `uvm_object_utils_begin(uvme_ral_st_cntxt_c)
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_ral_st_cntxt");
   
   /**
    * TODO Describe uvme_ral_st_cntxt_c::reset()
    */
   extern function void reset();
   
endclass : uvme_ral_st_cntxt_c


function uvme_ral_st_cntxt_c::new(string name="uvme_ral_st_cntxt");
   
   super.new(name);
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


function void uvme_ral_st_cntxt_c::reset();
   
   
   
endfunction : reset


`endif // __UVME_RAL_ST_CNTXT_SV__
