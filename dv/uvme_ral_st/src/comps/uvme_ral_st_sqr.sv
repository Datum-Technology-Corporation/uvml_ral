// Copyright 2021 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_SQR_SV__
`define __UVME_RAL_ST_SQR_SV__


/**
 * Component on which all the Moore.io Register Abstraction Layer UVM Extensions Self-Test sequences are run.
 */
class uvme_ral_st_sqr_c extends uvml_sqr_c #(
   .REQ(uvme_ral_st_seq_item_c),
   .RSP(uvme_ral_st_seq_item_c)
);
   
   // Objects
   uvme_ral_st_cfg_c    cfg  ; ///< 
   uvme_ral_st_cntxt_c  cntxt; ///< 
   
   // TLM
   uvm_analysis_port #(uvme_ral_st_seq_item_c)  ap; ///< 
   
   
   `uvm_component_utils_begin(uvme_ral_st_sqr_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_sqr", uvm_component parent=null);
   
   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_ral_st_sqr_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
endclass : uvme_ral_st_sqr_c


function uvme_ral_st_sqr_c::new(string name="uvme_ral_st_sqr", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_ral_st_sqr_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_ral_st_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_ral_st_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (cntxt == null) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   ap = new("ap", this);
   
endfunction : build_phase


task uvme_ral_st_sqr_c::run_phase(uvm_phase phase);
   
   uvme_ral_st_seq_item_c  seq_item;
   
   super.run_phase(phase);
   
   forever begin
      get_next_item(seq_item);
      ap.write     (seq_item);
      item_done();
   end
   
endtask : run_phase


`endif // __UVME_RAL_ST_SQR_SV__
