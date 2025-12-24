class sample_agent extends uvm_agent;
	
	`uvm_component_utils(sample_agent)

	sample_sqr sqr;
	sample_drv drv;
	sample_mon mon;
	sample_cov cov;
	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("agent_build_phase","inside agent_build_phase",UVM_MEDIUM)
		sqr=sample_sqr::type_id::create("sqr",this);
		drv=sample_drv::type_id::create("drv",this);
		mon=sample_mon::type_id::create("mon",this);
		cov=sample_cov::type_id::create("cov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("agent_connect_phase","inside agent_connect_phase",UVM_MEDIUM)
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.ap_port.connect(cov.analysis_export);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("agent_run_phase","inside agent_run_phase",UVM_MEDIUM)
	endtask

endclass

