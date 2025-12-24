
class ahb_tx extends uvm_sequence_item;
	rand int addr;
	rand int dataQ[$];
	rand bit wr_rd;
	rand bit[1:0] burst_type;

	`uvm_object_utils_begin(ahb_tx)
		`uvm_field_int(addr,UVM_ALL_ON)
		`uvm_field_queue_int(dataQ,UVM_ALL_ON)
		`uvm_field_int(wr_rd,UVM_ALL_ON)
		`uvm_field_int(burst_type,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction : new

	constraint atx {}
endclass : ahb_tx
