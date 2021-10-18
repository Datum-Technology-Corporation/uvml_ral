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


`ifndef __UVME_RAL_ST_RW_REG_SV__
`define __UVME_RAL_ST_RW_REG_SV__


/**
 * TODO Describe uvme_ral_st_rw_reg_c
 */
class uvme_ral_st_rw_reg_c extends uvml_ral_reg_c;
   
   // Register fields
   rand uvml_ral_reg_field_c  field_x; //< 
   rand uvml_ral_reg_field_c  field_y; //< 
   rand uvml_ral_reg_field_c  field_z; //< 
   
   
   `uvm_object_utils_begin(uvme_ral_st_rw_reg_c)
      `uvm_field_object(field_x, UVM_DEFAULT)
      `uvm_field_object(field_y, UVM_DEFAULT)
      `uvm_field_object(field_z, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_rw_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern function void build();
   
endclass : uvme_ral_st_rw_reg_c


function uvme_ral_st_rw_reg_c::new(string name="uvme_ral_st_rw_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_ral_st_rw_reg_c::build();
   
   field_x = uvml_ral_reg_field_c::type_id::create("field_x");
   field_x.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (   0),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
   field_y = uvml_ral_reg_field_c::type_id::create("field_y");
   field_y.configure(
      .parent                 (this),
      .size                   (   8),
      .lsb_pos                (   1),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
   field_z = uvml_ral_reg_field_c::type_id::create("field_z");
   field_z.configure(
      .parent                 (this),
      .size                   (  23),
      .lsb_pos                (   9),
      .access                 ("RW"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
endfunction: build


`endif // __UVME_RAL_ST_RW_REG_SV__
