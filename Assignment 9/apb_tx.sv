
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
  
  function new(string name="tx");
    super.new(name);
  endfunction
  
endclass