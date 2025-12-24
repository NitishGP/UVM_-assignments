
class ahb_sequencer extends uvm_sequencer#(ahb_tx);
	`uvm_component_utils(ahb_sequencer)
	`NEW
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("SEQUENCER_BUILD_PHASE","INSIDE SEQUENCER_BUILD_PHASE",UVM_MEDIUM)
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_NONE",UVM_NONE);
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_LOW",UVM_LOW);
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_MEDIUM",UVM_MEDIUM);
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_HIGH",UVM_HIGH);
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_FULL",UVM_FULL);
		uvm_report_info("SEQUENCER_BUILD_PHASE VERBOSITY","INSIDE SEQUENCER_BUILD_PHASE UVM_DEBUG",UVM_DEBUG);

	//Doubt::HOW do i change the set_report_severity_id_verbosity level of report methods called in base_seq from seqr?


		set_report_severity_id_verbosity(UVM_INFO,   "BASE_SQR_SEQ_SEVERITY",UVM_NONE);
		set_report_severity_id_verbosity(UVM_ERROR,  "BASE_SQR_SEQ_SEVERITY",UVM_HIGH);
		set_report_severity_id_verbosity(UVM_WARNING,"BASE_SQR_SEQ_SEVERITY",UVM_HIGH);
		set_report_severity_id_verbosity(UVM_FATAL,  "BASE_SQR_SEQ_SEVERITY",UVM_HIGH);


	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
`uvm_info("SEQUENCER_CONNECT_PHASE","INSIDE SEQUENCER_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);

		`uvm_info("SEQUENCER_DUMMY","TEST FOR Q15 in INSKILL Assign - 06 SEQUENCER_DUMMY0",UVM_MEDIUM)
		`uvm_info("SEQUENCER_DUMMY","TEST FOR Q15 in INSKILL Assign - 06 SEQUENCER_DUMMY1",UVM_HIGH)
		`uvm_info("SEQUENCER_DUMMY","TEST FOR Q15 in INSKILL Assign - 06 SEQUENCER_DUMMY2",UVM_LOW)
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE","INSIDE SEQUENCER_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
	`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE","INSIDE SEQUENCER_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("SEQUENCER_END_OF_ELABORATION_PHASE_VERBOSITY","INSIDE SEQUENCER_END_OF_ELABOARATION_PHASE UVM_DEBUG",UVM_DEBUG)

		uvm_report_info   ("BASE_SQR_SEQ_SEVERITY","INFO FROM BASE SEQ WITH LOW VERBOSITY",UVM_LOW);
		uvm_report_error  ("BASE_SQR_SEQ_SEVERITY","ERROR FROM BASE SEQ WITH HIGH VERBOSITY",UVM_HIGH);
		uvm_report_warning("BASE_SQR_SEQ_SEVERITY","WARNING FROM BASE SEQ WITH MEDIUM VERBOSITY",UVM_MEDIUM);
		uvm_report_fatal  ("BASE_SQR_SEQ_SEVERITY","FATAL ERROR MESSAGE FROM Base Seq having verbosity of DEBUG",UVM_DEBUG);
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("SEQUENCER_START_OF_SIMULATION_PHASE","INSIDE SEQUENCER_START_OF_SIMULATION_PHASE",UVM_MEDIUM)

	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("SEQUENCER_RUN_PHASE","INSIDE SEQUENCER_RUN_PHASE ",UVM_MEDIUM)
	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("SEQUENCER_EXTRACT_PHASE","INSIDE SEQUENCER_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("SEQUENCER_CHECK_PHASE","INSIDE SEQUENCER_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("SEQUENCER_report_PHASE","INSIDE SEQUENCER_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("SEQUENCER_FINAL_PHASE","INSIDE SEQUENCER_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase


endclass : ahb_sequencer
