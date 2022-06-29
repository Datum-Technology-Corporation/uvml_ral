// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_REG_BLOCK_SV__
`define __UVME_RAL_ST_REG_BLOCK_SV__


/**
 * TODO Describe uvme_ral_st_reg_block_c
 */
class uvme_ral_st_reg_block_c extends uvml_ral_reg_block_c;
   
   uvme_ral_st_cfg_c    cfg  ; ///< 
   uvme_ral_st_cntxt_c  cntxt; ///< 
   
   // Sub-Blocks
   
   // Registers
   rand uvme_ral_st_ro_reg_c  ro_regs[128]; ///< 
   rand uvme_ral_st_rw_reg_c  rw_regs[ 64]; ///< 
   
   
   `uvm_object_utils_begin(uvme_ral_st_reg_block_c)
      `uvm_field_sarray_object(ro_regs, UVM_DEFAULT)
      `uvm_field_sarray_object(rw_regs, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates sub-block(s).
    */
   extern virtual function void create_blocks();
   
   /**
    * Creates register(s).
    */
   extern virtual function void create_regs();
   
   /**
    * Creates default register map.
    */
   extern virtual function void create_reg_map();
   
   /**
    * Adds register(s) to register map.
    */
   extern virtual function void add_regs_to_map();
   
endclass : uvme_ral_st_reg_block_c


function uvme_ral_st_reg_block_c::new(string name="uvme_ral_st_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, has_coverage);
   
endfunction : new


function void uvme_ral_st_reg_block_c::create_blocks();
   
   
   
endfunction : create_blocks


function void uvme_ral_st_reg_block_c::create_regs();
   
   foreach (ro_regs[ii]) begin
      ro_regs[ii] = uvme_ral_st_ro_reg_c::type_id::create($sformatf("ro_regs[%0d]", ii));
      ro_regs[ii].configure(this);
      ro_regs[ii].build();
   end
   
   foreach (rw_regs[ii]) begin
      rw_regs[ii] = uvme_ral_st_rw_reg_c::type_id::create($sformatf("rw_regs[%0d]", ii));
      rw_regs[ii].configure(this);
      rw_regs[ii].build();
   end
   
endfunction : create_regs


function void uvme_ral_st_reg_block_c::create_reg_map();
   
   default_map = create_map(
      .name     ("default_map"),
      .base_addr(0),
      .n_bytes  (4),
      .endian   (UVM_LITTLE_ENDIAN)
   );
   
endfunction : create_reg_map


function void uvme_ral_st_reg_block_c::add_regs_to_map();
   
   int unsigned  base_addr = 0;
   
   foreach (ro_regs[ii]) begin
      default_map.add_reg(
         .rg    (ro_regs[ii]),
         .offset(base_addr+(ii*4)),
         .rights("RO")
      );
      base_addr = ii;
   end
   
   foreach (rw_regs[ii]) begin
      default_map.add_reg(
         .rg    (rw_regs[ii]),
         .offset(base_addr+(ii*4)),
         .rights("RW")
      );
      base_addr = ii;
   end
   
endfunction : add_regs_to_map


`endif // _UVME_RAL_ST_REG_BLOCK_SV__
