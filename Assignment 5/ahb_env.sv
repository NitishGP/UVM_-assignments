
class ahb_env extends uvm_env;
	`uvm_component_utils(ahb_env)
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction : new
	ahb_producer producer;
	ahb_consumer consumer;
	ahb_agent agent;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		consumer=ahb_consumer::type_id::create("consumer",this);
		producer=ahb_producer::type_id::create("producer",this);
		agent=ahb_agent::type_id::create("agent",this);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase );
`uvm_info("ENV_CONNECT_PHASE","INSIDE ENV_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("ENV_END_OF_ELABORATION_PHASE","INSIDE ENV_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("ENV_START_OF_SIMULATION_PHASE","INSIDE ENV_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("ENV_RUN_PHASE","INSIDE ENV_RUN_PHASE ",UVM_MEDIUM)
	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("ENV_EXTRACT_PHASE","INSIDE ENV_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("ENV_CHECK_PHASE","INSIDE ENV_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("ENV_report_PHASE","INSIDE ENV_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("ENV_FINAL_PHASE","INSIDE ENV_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase


endclass : ahb_env
