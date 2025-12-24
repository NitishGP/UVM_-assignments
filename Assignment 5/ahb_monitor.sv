class ahb_monitor extends uvm_monitor;
	`uvm_component_utils(ahb_monitor)
	function new (string name, uvm_component parent);
		super.new(name,parent);
	endfunction : new
	
	uvm_analysis_port#(ahb_tx) mon_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
`uvm_info("MONITOR_BUILD_PHASE","INSIDE MONITOR_BUILD_PHASE",UVM_MEDIUM)
	mon_port=new("mon_port",this);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
`uvm_info("MONITOR_CONNECT_PHASE","INSIDE MONITOR_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("MONITOR_END_OF_ELABORATION_PHASE","INSIDE MONITOR_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("MONITOR_START_OF_SIMULATION_PHASE","INSIDE MONITOR_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction :start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("MONITOR_RUN_PHASE","INSIDE MONITOR_RUN_PHASE ",UVM_MEDIUM)
	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("MONITOR_EXTRACT_PHASE","INSIDE MONITOR_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("MONITOR_CHECK_PHASE","INSIDE MONITOR_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("MONITOR_report_PHASE","INSIDE MONITOR_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("MONITOR_FINAL_PHASE","INSIDE MONITOR_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase

	function void write(ahb_tx t);
		//
	endfunction : write

endclass : ahb_monitor
