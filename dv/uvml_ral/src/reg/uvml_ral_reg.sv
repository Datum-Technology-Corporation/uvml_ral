// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_RAL_REG_SV__
`define __UVML_RAL_REG_SV__


/**
 * TODO Describe uvml_ral_reg_c
 */
class uvml_ral_reg_c extends uvm_reg;
   
   // Fields
   
   
   
   `uvm_object_utils_begin(uvml_ral_reg_c)
      // UVM Field Util Macros
   `uvm_object_utils_end
   
   
   // Constraints
   
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_ral_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   // Methods
   
   
endclass : uvml_ral_reg_c


function uvml_ral_reg_c::new(string name="uvml_ral_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


`endif // __UVML_RAL_REG_SV__
