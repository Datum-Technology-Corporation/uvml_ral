// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_RAL_REG_FIELD_SV__
`define __UVML_RAL_REG_FIELD_SV__


/**
 * TODO Describe uvml_ral_reg_field_c
 */
class uvml_ral_reg_field_c extends uvm_reg_field;
   
   // Fields
   
   
   
   `uvm_object_utils_begin(uvml_ral_reg_field_c)
      // UVM Field Util Macros
   `uvm_object_utils_end
   
   
   // Constraints
   
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_ral_reg_field");
   
   // Methods
   
   
endclass : uvml_ral_reg_field_c


function uvml_ral_reg_field_c::new(string name="uvml_ral_reg_field");
   
   super.new(name);
   
endfunction : new


`endif // __UVML_RAL_REG_FIELD_SV__
