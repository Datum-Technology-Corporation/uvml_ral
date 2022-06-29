// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_LOGS_SEQ_ITEM_SV__
`define __UVME_LOGS_SEQ_ITEM_SV__


/**
 * TODO Describe uvme_ral_st_seq_item_c
 */
class uvme_ral_st_seq_item_c extends uvml_seq_item_c;
   
   // Fields
   rand bit          we     ; ///< 
   rand bit [31:00]  address; ///< 
   rand bit [31:00]  wdata  ; ///< 
   rand bit [31:00]  rdata  ; ///< 
   rand bit [03:00]  be     ; ///< 
   
   
   `uvm_object_utils_begin(uvme_ral_st_seq_item_c)
      `uvm_field_int(we     , UVM_DEFAULT)
      `uvm_field_int(address, UVM_DEFAULT)
      `uvm_field_int(wdata  , UVM_DEFAULT)
      `uvm_field_int(rdata  , UVM_DEFAULT)
      `uvm_field_int(be     , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_seq_item");
   
endclass : uvme_ral_st_seq_item_c


function uvme_ral_st_seq_item_c::new(string name="uvme_ral_st_seq_item");
   
   super.new(name);
   
endfunction : new


`endif // __UVME_LOGS_SEQ_ITEM_SV__
