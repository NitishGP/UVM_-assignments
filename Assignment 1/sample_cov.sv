class sample_cov extends uvm_subscriber #(sample_tx);
	
	`uvm_component_utils(sample_cov)
	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("cov_build_phase","inside cov_build_phase",UVM_MEDIUM)
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("cov_connect_phase","inside cov_connect_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("cov_run_phase","inside cov_run_phase",UVM_MEDIUM)
	endtask

	function void write(sample_tx t);

	endfunction

endclass



