// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_RO_REG_SV__
`define __UVME_RAL_ST_RO_REG_SV__


/**
 * TODO Describe uvme_ral_st_ro_reg_c
 */
class uvme_ral_st_ro_reg_c extends uvml_ral_reg_c;
   
   // Register fields
   rand uvml_ral_reg_field_c  field_a; ///< 
   rand uvml_ral_reg_field_c  field_b; ///< 
   rand uvml_ral_reg_field_c  field_c; ///< 
   
   
   `uvm_object_utils_begin(uvme_ral_st_ro_reg_c)
      `uvm_field_object(field_a, UVM_DEFAULT)
      `uvm_field_object(field_b, UVM_DEFAULT)
      `uvm_field_object(field_c, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_ro_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern function void build();
   
endclass : uvme_ral_st_ro_reg_c


function uvme_ral_st_ro_reg_c::new(string name="uvme_ral_st_ro_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_ral_st_ro_reg_c::build();
   
   field_a = uvml_ral_reg_field_c::type_id::create("field_a");
   field_a.configure(
      .parent                 (this),
      .size                   (  16),
      .lsb_pos                (   0),
      .access                 ("RO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
   field_b = uvml_ral_reg_field_c::type_id::create("field_b");
   field_b.configure(
      .parent                 (this),
      .size                   (   1),
      .lsb_pos                (  16),
      .access                 ("RO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
   field_c = uvml_ral_reg_field_c::type_id::create("field_c");
   field_c.configure(
      .parent                 (this),
      .size                   (   8),
      .lsb_pos                (  17),
      .access                 ("RO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   1)
   );
   
endfunction: build


`endif // __UVME_RAL_ST_RO_REG_SV__
