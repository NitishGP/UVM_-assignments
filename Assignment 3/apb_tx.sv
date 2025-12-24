class apb_tx extends uvm_sequence_item;
	`new_object
	
   rand logic [`ADDR_WIDTH-1:0] PADDR;  
   logic PSELx ; 
   rand logic PWRITE; 
   rand logic [`WIDTH-1:0] PWDATA; 
   rand logic PENABLE;
	logic [`WIDTH-1:0] PRDATA; 

	`uvm_object_utils_begin(apb_tx)
		`uvm_field_int(PRDATA,UVM_ALL_ON);
		`uvm_field_int(PSELx,UVM_ALL_ON);
		`uvm_field_int(PADDR,UVM_ALL_ON);
		`uvm_field_int(PWDATA,UVM_ALL_ON);
		`uvm_field_int(PENABLE,UVM_ALL_ON);
		`uvm_field_int(PWRITE,UVM_ALL_ON);
	`uvm_object_utils_end

endclass