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


`ifndef __UVME_RAL_ST_ENV_SV__
`define __UVME_RAL_ST_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other the Moore.io Register Abstraction Layer UVM
 * Extensions environment components.
 */
class uvme_ral_st_env_c extends uvml_env_c;
   
   // Objects
   uvme_ral_st_cfg_c    cfg  ; ///< 
   uvme_ral_st_cntxt_c  cntxt; ///< 
   
   // Components
   uvme_ral_st_cov_model_c  cov_model; ///< 
   uvme_ral_st_sqr_c        sequencer; ///< 
   
   
   `uvm_component_utils_begin(uvme_ral_st_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_env", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Retrieves cntxt.clk_vif from UVM configuration database via retrieve_clk_vif()
    * 3. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 4. Builds all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * 1. Connects agents to predictor via connect_predictor()
    * 2. Connects predictor & agents to scoreboard via connect_scoreboard()
    * 3. Assembles virtual sequencer handles via assemble_vsequencer()
    * 4. Connects agents to coverage model via connect_coverage_model()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   extern function void assign_cfg();
   
   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   extern function void assign_cntxt();
   
   /**
    * Creates additional (non-agent) environment components (and objects).
    */
   extern function void create_env_components();
   
   /**
    * Creates environment's sequencer.
    */
   extern function void create_sequencer();
   
   /**
    * Creates environment's coverage model.
    */
   extern function void create_cov_model();
   
   /**
    * Connects environment coverage model to agents/scoreboards/predictor.
    */
   extern function void connect_coverage_model();
   
endclass : uvme_ral_st_env_c


function uvme_ral_st_env_c::new(string name="uvme_ral_st_env", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_ral_st_env_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_ral_st_cfg_c)::get(this, "", "cfg", cfg));
   if (cfg == null) begin
      `uvm_fatal("RAL_ST_ENV", "Configuration handle is null")
   end
   else begin
      `uvm_info("RAL_ST_ENV", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end
   
   if (cfg.enabled) begin
      void'(uvm_config_db#(uvme_ral_st_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (cntxt == null) begin
         `uvm_info("RAL_ST_ENV", "Context handle is null; creating.", UVM_DEBUG)
         cntxt = uvme_ral_st_cntxt_c::type_id::create("cntxt");
      end
      
      assign_cfg           ();
      assign_cntxt         ();
      create_env_components();
      
      if (cfg.is_active) begin
         create_sequencer();
      end
      
      if (cfg.cov_model_enabled) begin
         create_cov_model();
      end
   end
   
endfunction : build_phase


function void uvme_ral_st_env_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      if (cfg.cov_model_enabled) begin
         connect_coverage_model();
      end
   end
   
endfunction: connect_phase


function void uvme_ral_st_env_c::assign_cfg();
   
   uvm_config_db#(uvme_ral_st_cfg_c)::set(this, "*", "cfg", cfg);
   
endfunction: assign_cfg


function void uvme_ral_st_env_c::assign_cntxt();
   
   uvm_config_db#(uvme_ral_st_cntxt_c)::set(this, "*", "cntxt", cntxt);
   
endfunction: assign_cntxt


function void uvme_ral_st_env_c::create_env_components();
   
   
   
endfunction: create_env_components


function void uvme_ral_st_env_c::create_ral_adapter();
   
   reg_adapter = uvme_ral_st_reg_adapter_c::type_id::create("reg_adapter");
   reg_block = cfg.reg_block;
   reg_block.cntxt = cntxt;
   
endfunction: create_ral_adapter


function void uvme_ral_st_env_c::create_sequencer();
   
   sequencer = uvme_ral_st_sqr_c::type_id::create("sequencer", this);
   
endfunction: create_sequencer


function void uvme_ral_st_env_c::create_cov_model();
   
   cov_model = uvme_ral_st_cov_model_c::type_id::create("cov_model", this);
   
endfunction: create_cov_model


function void uvme_ral_st_env_c::connect_reg_block();
   
   reg_block.connect();
   reg_block.default_map.set_sequencer(sequencer, reg_adapter);
   reg_block.default_map.set_auto_predict(1);
   
endfunction: connect_reg_block


function void uvme_ral_st_env_c::connect_coverage_model();
   
   /*abc_agent.drv_ap.connect(cov_model.abc_seq_item_export);
   abc_agent.mon_ap.connect(cov_model.abc_mon_trn_export );
   def_agent.mon_ap.connect(cov_model.def_mon_trn_export );*/
   
endfunction: connect_coverage_model


`endif // __UVME_RAL_ST_ENV_SV__