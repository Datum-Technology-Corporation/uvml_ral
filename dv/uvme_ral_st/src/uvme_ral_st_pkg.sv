// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_PKG_SV__
`define __UVME_RAL_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvml_ral_macros.svh"
`include "uvme_ral_st_macros.svh"

// Interface(s)


 /**
 * Encapsulates all the types needed for an UVM environment capable of self-testing the Moore.io Register
 * Abstraction Layer UVM Extensions VIP.
 */
package uvme_ral_st_pkg;

   import uvm_pkg      ::*;
   import uvml_pkg     ::*;
   import uvml_logs_pkg::*;
   import uvml_ral_pkg ::*;

   // Constants / Structs / Enums
   `include "uvme_ral_st_tdefs.sv"
   `include "uvme_ral_st_constants.sv"

   // Register Abstraction Layer
   `include "uvme_ral_st_rw_reg.sv"
   `include "uvme_ral_st_ro_reg.sv"
   `include "uvme_ral_st_reg_block.sv"

   // Objects
   `include "uvme_ral_st_cfg.sv"
   `include "uvme_ral_st_cntxt.sv"
   `include "uvme_ral_st_seq_item.sv"
   `include "uvme_ral_st_reg_adapter.sv"

   // Environment components
   `include "uvme_ral_st_cov_model.sv"
   `include "uvme_ral_st_seq_item_logger.sv"
   `include "uvme_ral_st_sqr.sv"
   `include "uvme_ral_st_env.sv"

   // Sequences
   `include "uvme_ral_st_base_seq.sv"
   `include "uvme_ral_st_seq_lib.sv"

endpackage : uvme_ral_st_pkg


// Module(s) / Checker(s)
`ifdef UVME_RAL_ST_INC_CHKR
`include "uvme_ral_st_chkr.sv"
`endif


`endif // __UVME_RAL_ST_PKG_SV__
