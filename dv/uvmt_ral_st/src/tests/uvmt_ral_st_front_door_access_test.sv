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


`ifndef __UVMT_RAL_ST_FRONT_DOOR_ACCESS_TEST_SV__
`define __UVMT_RAL_ST_FRONT_DOOR_ACCESS_TEST_SV__


/**
 * TODO Describe uvmt_ral_st_front_door_access_test_c
 */
class uvmt_ral_st_front_door_access_test_c extends uvmt_ral_st_base_test_c;
   
   rand uvme_ral_st_rand_access_seq_c  rand_access_seq; ///< 
   
   
   `uvm_component_utils(uvmt_ral_st_front_door_access_test_c)
   
   
   constraint test_cons {
      rand_access_seq.num_accesses == test_cfg.num_accesses;
   }
   
   
   /**
    * Creates rand_access_seq.
    */
   extern function new(string name="uvmt_ral_st_front_door_access_test", uvm_component parent=null);
   
   /**
    * Runs rand_access_seq on sequencer.
    */
   extern virtual task main_phase(uvm_phase phase);
   
endclass : uvmt_ral_st_front_door_access_test_c


function uvmt_ral_st_front_door_access_test_c::new(string name="uvmt_ral_st_front_door_access_test", uvm_component parent=null);
   
   super.new(name, parent);
   rand_access_seq = uvme_ral_st_rand_access_seq_c::type_id::create("rand_access_seq");
   
endfunction : new


task uvmt_ral_st_front_door_access_test_c::main_phase(uvm_phase phase);
   
   super.main_phase(phase);
   
   phase.raise_objection(this);
   `uvm_info("TEST", $sformatf("Starting rand_access sequence:\n%s", rand_access_seq.sprint()), UVM_NONE)
   rand_access_seq.start(sequencer);
   `uvm_info("TEST", $sformatf("Finished rand_access sequence:\n%s", rand_access_seq.sprint()), UVM_NONE)
   phase.drop_objection(this);
   
endtask : main_phase


`endif // __UVMT_RAL_ST_FRONT_DOOR_ACCESS_TEST_SV__
