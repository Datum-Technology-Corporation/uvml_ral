// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_BASE_SEQ_SV__
`define __UVME_RAL_ST_BASE_SEQ_SV__


/**
 * Abstract object from which all other the Moore.io Register Abstraction Layer UVM Extensions virtual sequences extend.
 * Does not generate any sequence items of its own. Subclasses must be run on
 * the Moore.io Register Abstraction Layer UVM Extensions Virtual Sequencer (uvme_ral_st_vsqr_c) instance.
 */
class uvme_ral_st_base_seq_c extends uvml_seq_c #(
   .REQ(uvme_ral_st_seq_item_c),
   .RSP(uvme_ral_st_seq_item_c)
);
   
   // Environment handles
   uvme_ral_st_cfg_c    cfg  ; ///< 
   uvme_ral_st_cntxt_c  cntxt; ///< 
   
   
   `uvm_object_utils(uvme_ral_st_base_seq_c)
   `uvm_declare_p_sequencer(uvme_ral_st_sqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_base_vseq");
   
   /**
    * Retrieve cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();
   
endclass : uvme_ral_st_base_seq_c


function uvme_ral_st_base_seq_c::new(string name="uvme_ral_st_base_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_ral_st_base_seq_c::pre_start();
   
   cfg   = p_sequencer.cfg  ;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


`endif // __UVME_RAL_ST_BASE_SEQ_SV__
