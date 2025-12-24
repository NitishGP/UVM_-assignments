
class ahb_agent extends uvm_agent;
	`uvm_component_utils(ahb_agent)
	ahb_driver drv;
	ahb_sequencer sqr;
	ahb_monitor mon;
	ahb_coverage cov;

	`NEW

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
`uvm_info("AGENT_BUILD_PHASE","INSIDE AGENT_BUILD_PHASE",UVM_MEDIUM)
		drv=ahb_driver::type_id::create("drv",this);
		sqr=ahb_sequencer::type_id::create("sqr",this);
		mon=ahb_monitor::type_id::create("mon",this);
		cov=ahb_coverage::type_id::create("cov",this);


		drv.set_report_id_verbosity("DRIVER_DUMMY0",UVM_MEDIUM);
		drv.set_report_id_verbosity("DRIVER_DUMMY1",UVM_HIGH);
		drv.set_report_id_verbosity("DRIVER_DUMMY2",UVM_LOW);
		drv.set_report_id_verbosity("DRIVER_DUMMY3",UVM_FULL);

		mon.set_report_id_verbosity("MONITOR_DUMMY",UVM_MEDIUM);
		cov.set_report_id_verbosity("COVERAGE_DUMMY",UVM_HIGH);
		sqr.set_report_id_verbosity("SEQUENCER_DUMMY",UVM_LOW);

		
		set_report_severity_id_verbosity(UVM_INFO,"SEQUENCER_ERROR",UVM_LOW);
		uvm_report_error("SEQUENCER_ERROR","THIS IS ERROR TO TEST FOR set_report_severity_id_verbosity",UVM_HIGH);

	endfunction : build_phase

	function void connect_phase(uvm_phase phase );
`uvm_info("AGENT_CONNECT_PHASE","INSIDE AGENT_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.mon_port.connect(cov.analysis_export);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE","INSIDE AGENT_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("AGENT_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE AGENT_END_OF_ELABOARATION_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("AGENT_START_OF_SIMULATION_PHASE","INSIDE AGENT_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction :start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("AGENT_RUN_PHASE","INSIDE AGENT_RUN_PHASE ",UVM_MEDIUM)
	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("AGENT_EXTRACT_PHASE","INSIDE AGENT_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("AGENT_CHECK_PHASE","INSIDE AGENT_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("AGENT_report_PHASE","INSIDE AGENT_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("AGENT_FINAL_PHASE","INSIDE AGENT_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase

	
endclass : ahb_agent
