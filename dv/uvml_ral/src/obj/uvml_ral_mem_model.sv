// Copyright 2021 OpenHW Group
// Copyright 2021 Datum Technology Corporation
// Copyright 2021 Silicon Labs
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVML_RAL_MEM_MODEL_SV__
`define __UVML_RAL_MEM_MODEL_SV__


/**
 * Memory model
 */
class uvml_ral_mem_model_c #(
   int unsigned XLEN = `UVML_RAL_MEM_DEFAULT_XLEN
) extends uvm_object;

   rand      uvml_ral_mem_default_val_enum  mem_default            ; ///<
   rand      bit[7:0]                       mem_default_const_value; ///<
   protected logic[7:0]                     _mem[bit[XLEN-1:0]]    ; ///<


   `uvm_object_utils_begin(uvml_ral_mem_model_c);
      `uvm_field_enum(uvml_ral_mem_default_val_enum, mem_default        , UVM_DEFAULT)
      `uvm_field_int (                           mem_default_const_value, UVM_DEFAULT)
   `uvm_object_utils_end


   constraint defaults_cons {
      // By default avoid X's from this memory, can be overriden by core config constraints if X's are desired for some reason
      soft mem_default != UVML_RAL_MEM_DEFAULT_VAL_X;
   }


   /**
    * Default constructor
    */
   extern function new(string name="uvml_ral_mem_model");

   /**
    * Write to memory array
    */
   extern function void write(bit[XLEN-1:0] addr, logic[7:0] data);

   /**
    * Read from memory array, substituing a default value in case value is not in memory
    */
   extern function logic[7:0] read(bit[XLEN-1:0] addr);

   /**
    * Wrapper around readmemh for underlying memory
    */
   extern function void readmemh(string mem_file_path);

endclass : uvml_ral_mem_model_c


function uvml_ral_mem_model_c::new(string name="uvml_ral_mem_model");

   super.new(name);

endfunction : new


function void uvml_ral_mem_model_c::write(bit[XLEN-1:0] addr, logic[7:0] data);

   _mem[addr] = data;

endfunction : write


function logic[7:0] uvml_ral_mem_model_c::read(bit[XLEN-1:0] addr);

   if (!_mem.exists(addr)) begin
      case (mem_default)
         UVML_RAL_MEM_DEFAULT_VAL_X:      _mem[addr] = 'x;
         UVML_RAL_MEM_DEFAULT_VAL_0:      _mem[addr] = '0;
         UVML_RAL_MEM_DEFAULT_VAL_CONST:  _mem[addr] = mem_default_const_value;
         UVML_RAL_MEM_DEFAULT_VAL_INCR:   _mem[addr] = addr[7:0];
         UVML_RAL_MEM_DEFAULT_VAL_RANDOM: _mem[addr] = $urandom();
      endcase
   end

   return _mem[addr];

endfunction : read


function void uvml_ral_mem_model_c::readmemh(string mem_file_path);

   string error_desc;
   int file  = $fopen(mem_file_path, "r");
   int errno = $ferror(file, error_desc);

   if (errno != 0) begin
      `uvm_fatal("MEM_OBJ", $sformatf("Cannot open %s for reading (error description: %s)", mem_file_path, error_desc))
   end
   else begin
      $fclose(file);
      `uvm_info("MEM_OBJ", $sformatf("Loading memory contents from %s", mem_file_path), UVM_LOW)
      $readmemh(mem_file_path, _mem);
   end

endfunction : readmemh


`endif // __UVML_RAL_MEM_MODEL_SV__
