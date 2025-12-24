
class apb_seq_lib extends uvm_sequence#(apb_tx);
	`uvm_object_utils(apb_seq_lib)
	`new_object

endclass

class seq_1wr extends apb_seq_lib;
	`uvm_object_utils(seq_1wr)
	`new_object

	task body();
		`uvm_do_with(req,{req.PWRITE==1;})
	endtask
endclass

class seq_1rd extends apb_seq_lib;
	`uvm_object_utils(seq_1rd)
	`new_object

	task body();
		`uvm_do_with(req,{req.PWRITE==0;})
	endtask
endclass

class seq_1wr_1rd extends apb_seq_lib;
	`uvm_object_utils(seq_1wr_1rd)
	`new_object
	
	task body();
		seq_1wr seq1;
		seq_1rd seq2;
		seq1=seq_1wr::type_id::create("seq1");
		seq2=seq_1rd::type_id::create("seq2");
		`uvm_do(seq1)
		`uvm_do(seq2)
	endtask
endclass

class seq_nwr_nrd extends apb_seq_lib;
	bit[`ADDR_WIDTH-1:0] txQ[$];
	`uvm_object_utils_begin(seq_nwr_nrd)
		`uvm_field_queue_int(txQ,UVM_ALL_ON)
	`uvm_object_utils_end
	`new_object
	
	task body();
		seq_1wr seq1;
		seq_1rd seq2;
		seq1=seq_1wr::type_id::create("seq1");
		seq2=seq_1rd::type_id::create("seq2");
		repeat(`COUNT) begin
			`uvm_do(seq1)
			txQ.push_back(seq1.req.PADDR);
		end
		repeat(`COUNT) `uvm_do_with(seq2.req,{seq2.req.PADDR==txQ.pop_front();seq2.req.PWRITE==0;})
	endtask
endclass
