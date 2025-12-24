
class ahb_producer extends uvm_component;
	`uvm_component_utils(ahb_producer)
	`NEW
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("PRODUCER_BUILD_PHASE_VERBOSITY","INSIDE PRODUCER_BUILD_PHASE UVM_DEBUG",UVM_DEBUG)


	//	uvm_report_info("PRODUCER LOG FILE","result printed from producer and info into result.log file",UVM_NONE,result.log);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase );
`uvm_info("PRODUCER_CONNECT_PHASE","INSIDE PRODUCER_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("PRODUCER_END_OF_ELABORATION_PHASE","INSIDE PRODUCER_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("PRODUCER_START_OF_SIMULATION_PHASE","INSIDE PRODUCER_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("PRODUCER_RUN_PHASE","INSIDE PRODUCER_RUN_PHASE ",UVM_MEDIUM)
	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("PRODUCER_EXTRACT_PHASE","INSIDE PRODUCER_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("PRODUCER_CHECK_PHASE","INSIDE PRODUCER_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("PRODUCER_report_PHASE","INSIDE PRODUCER_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("PRODUCER_FINAL_PHASE","INSIDE PRODUCER_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase

endclass : ahb_producer
