
class ahb_base_sequence extends uvm_sequence#(ahb_tx);
	`uvm_object_utils(ahb_base_sequence)
	uvm_phase phase;

	function new(string name="");
		super.new(name);
	endfunction : new

	task pre_body();
		`uvm_info("BASE_SEQ_PRE_BODY","INSIDE BASE_SEQ_PRE_BODY",UVM_HIGH)
		phase=get_starting_phase();
		if(phase!=null) begin
			phase.raise_objection(null);
		end
	endtask : pre_body

	task body();
		`uvm_info("BASE_SEQ_BODY","INSIDE BASE_SEQ_BODY",UVM_HIGH)
		#10;
	endtask : body

	task post_body();
		`uvm_info("BASE_SEQ_POST_BODY","INSIDE BASE_SEQ_POST_BODY",UVM_HIGH)
		if(phase!=null) begin
			phase.drop_objection(null);
		end
	endtask : post_body
endclass : ahb_base_sequence
