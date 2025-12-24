class sample_sbd extends uvm_scoreboard;
	
	`uvm_component_utils(sample_sbd)
	
	uvm_analysis_imp #(sample_tx,sample_sbd) sbd_imp;

	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("sbd_build_phase","inside sbd_build_phase",UVM_MEDIUM)
		sbd_imp=new("sbd_imp",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("sbd_connect_phase","inside sbd_connect_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("sbd_run_phase","inside sbd_run_phase",UVM_MEDIUM)
	endtask

	function void write(sample_tx t);

	endfunction

endclass


