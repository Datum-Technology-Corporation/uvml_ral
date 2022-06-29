// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_SEQ_ITEM_LOGGER_SV__
`define __UVME_RAL_ST_SEQ_ITEM_LOGGER_SV__


/**
 * TODO Describe uvme_ral_st_seq_item_logger_c
 */
class uvme_ral_st_seq_item_logger_c extends uvml_logs_seq_item_logger_c #(
   .T_TRN  (uvme_ral_st_seq_item_c),
   .T_CFG  (uvme_ral_st_cfg_c     ),
   .T_CNTXT(uvme_ral_st_cntxt_c   )
);
   
   `uvm_component_utils(uvme_ral_st_seq_item_logger_c)
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_seq_item_logger", uvm_component parent=null);
   
   /**
    * Writes contents of t to disk
    */
   extern virtual function void write(uvme_ral_st_seq_item_c t);
   
   /**
    * Writes log header to disk
    */
   extern virtual function void print_header();
   
endclass : uvme_ral_st_seq_item_logger_c


function uvme_ral_st_seq_item_logger_c::new(string name="uvme_ral_st_seq_item_logger", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_ral_st_seq_item_logger_c::write(uvme_ral_st_seq_item_c t);
   
   string  access  = t.we ? "  W" : "R  ";
   string  address = $sformatf("%h", t.address);
   string  data    = t.we ? $sformatf("%h", t.wdata) : $sformatf("%h", t.rdata);
   
   `uvm_info("SEQ_ITEM_LOGGER", $sformatf("Printing transaction to file:\n%s", t.sprint()), UVM_HIGH)
   fwrite($sformatf("     %0t     | %s | %s | %s", $realtime(), access, address, data));
   
endfunction : write


function void uvme_ral_st_seq_item_logger_c::print_header();
   
   `uvm_info("SEQ_ITEM_LOGGER", "Printing transation log header to file", UVM_HIGH)
   fwrite("----------------------------");
   fwrite("     TIME     | R/W | ADDRESS | DATA");
   fwrite("----------------------------");
   
endfunction : print_header


`endif // __UVME_RAL_ST_SEQ_ITEM_LOGGER_SV__
