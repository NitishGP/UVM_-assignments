class sample_sqr extends uvm_sequencer #(sample_tx);
	
	`uvm_component_utils(sample_sqr)
	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("sqr_build_phase","inside sqr_build_phase",UVM_MEDIUM)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("sqr_connect_phase","inside sqr_connect_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("sqr_run_phase","inside sqr_run_phase",UVM_MEDIUM)
	endtask

endclass


