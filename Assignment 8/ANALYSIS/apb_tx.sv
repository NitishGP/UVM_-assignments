class apb_tx extends uvm_sequence_item;
	rand int addr,dataQ[$];
	rand bit wr_rd;
	rand bit[1:0] burst_type;

	`uvm_object_utils_begin(apb_tx)
		`uvm_field_int(addr,UVM_DEFAULT)
		`uvm_field_queue_int(dataQ,UVM_DEFAULT)
		`uvm_field_int(wr_rd,UVM_DEFAULT)
		`uvm_field_int(burst_type,UVM_DEFAULT)
	`uvm_object_utils_end
	`NEW_OBJ
	
endclass
