// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_RAL_ST_RAND_ACCESS_SEQ_SV__
`define __UVME_RAL_ST_RAND_ACCESS_SEQ_SV__


/**
 * TODO Describe uvme_ral_st_rand_access_seq_c
 */
class uvme_ral_st_rand_access_seq_c extends uvme_ral_st_base_seq_c;
   
   // Fields
   rand int unsigned  num_accesses; ///< 
   
   
   `uvm_object_utils_begin(uvme_ral_st_rand_access_seq_c)
      `uvm_field_int(num_accesses, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      num_accesses > 0;
      num_accesses <= 100;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_ral_st_reg_vseq");
   
   /**
    * TODO Describe uvme_ral_st_rand_access_seq_c::body()
    */
   extern virtual task body();
   
endclass : uvme_ral_st_rand_access_seq_c


function uvme_ral_st_rand_access_seq_c::new(string name="uvme_ral_st_reg_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_ral_st_rand_access_seq_c::body();
   
   uvm_reg         my_regs[$] ;
   uvm_reg         current_reg;
   uvm_status_e    status     ;
   uvm_reg_data_t  value      ;
   
   cfg.reg_block.get_registers(my_regs);
   my_regs.shuffle();
   
   for (int unsigned ii=0; ii<num_accesses; ii++) begin
      current_reg = my_regs.pop_front();
      `uvm_info("TRAFFIC_VSEQ", $sformatf("Performing access #%0d of %0d:\n%s", ii+1, num_accesses, current_reg.sprint()), UVM_LOW)
      randcase
         2: begin
            current_reg.read(status, value);
         end
         1: begin
            current_reg.write(status, $urandom());
         end
      endcase
      #100ns;
   end
   
endtask : body


`endif // __UVME_RAL_ST_RAND_ACCESS_SEQ_SV__
