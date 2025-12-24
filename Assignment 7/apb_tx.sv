
class apb_tx extends uvm_sequence_item;
  
  rand int addr;
  rand int data;
  rand bit wr_rd;
  rand bit[1:0] sel;
  
  `uvm_object_utils_begin(apb_tx)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(data,UVM_ALL_ON)
  `uvm_field_int(wr_rd,UVM_ALL_ON)
  `uvm_field_int(sel,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="");
    super.new(name);
  endfunction
  virtual task body();
    `uvm_info("TX","TX GENERATED",UVM_MEDIUM)
  endtask
endclass

class apb_bad_tx extends apb_tx;
  rand int aa;
  `uvm_object_utils_begin(apb_bad_tx)
  `uvm_field_int(aa,UVM_ALL_ON)
  `uvm_object_utils_end
  `NEW_OBJ
  
  task body();
    `uvm_warning("BAD_TX","BAD_TX GENERATED")
  endtask
  
endclass