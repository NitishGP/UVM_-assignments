class sample_env extends uvm_env;
	
	`uvm_component_utils(sample_env)
	 sample_agent agent; 
	 sample_sbd sbd; 


//	`constructor
//     or
	function new(string name="",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("env_build_phase","inside env_build_phase",UVM_MEDIUM)
		agent=sample_agent::type_id::create("env",this);
		sbd=sample_sbd::type_id::create("sbd",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("env_connect_phase","inside env_connect_phase",UVM_MEDIUM)
		agent.mon.ap_port.connect(sbd.sbd_imp);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("env_run_phase","inside env_run_phase",UVM_MEDIUM)
	endtask

endclass
