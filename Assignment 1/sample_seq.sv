
class sample_seq extends uvm_sequence #(sample_tx);

	`uvm_object_utils(sample_seq)

	function new(string name="");
		super.new(name);
	endfunction

	task body();

	endtask
	
endclass
