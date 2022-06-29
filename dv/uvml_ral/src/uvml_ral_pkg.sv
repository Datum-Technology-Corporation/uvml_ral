// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_RAL_PKG_SV__
`define __UVML_RAL_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_ral_macros.svh"


/**
 * Encapsulates all the types needed for the Moore.io Register Abstraction Layer library.
 */
package uvml_ral_pkg;

   import uvm_pkg ::*;
   import uvml_pkg::*;

   // Constants / Structs / Enums
   `include "uvml_ral_tdefs.sv"
   `include "uvml_ral_constants.sv"

   // Objects
   `include "uvml_ral_reg_field.sv"
   `include "uvml_ral_reg.sv"
   `include "uvml_ral_reg_block.sv"
   `include "uvml_ral_reg_adapter.sv"

endpackage : uvml_ral_pkg


`endif // __UVML_RAL_PKG_SV__
