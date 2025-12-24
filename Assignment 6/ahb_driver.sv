class ahb_driver extends uvm_driver#(ahb_tx);
	`uvm_component_utils(ahb_driver)
	`NEW
	virtual ahb_intf vif;
	ahb_tx tx;

	function void build_phase(uvm_phase phase);
`uvm_info("DRIVER_BUILD_PHASE","INSIDE DRIVER_BUILD_PHASE",UVM_MEDIUM)
		super.build_phase(phase);
		assert(!uvm_config_db#(virtual ahb_intf)::get(this,"","vif",vif));
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
`uvm_info("DRIVER_CONNECT_PHASE","INSIDE DRIVER_CONNECT_PHASE",UVM_MEDIUM)
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("DRIVER_END_OF_ELABORATION_PHASE","INSIDE DRIVER_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
`uvm_info("DRIVER_DUMMY0","TEST FOR Q15 in INSKILL Assign - 06 DRIVER_DUMMY0 ",UVM_MEDIUM)
`uvm_info("DRIVER_DUMMY1","TEST FOR Q15 in INSKILL Assign - 06 DRIVER_DUMMY1",UVM_MEDIUM)
`uvm_info("DRIVER_DUMMY2","TEST FOR Q15 in INSKILL Assign - 06 DRIVER_DUMMY2",UVM_MEDIUM)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("DRIVER_START_OF_SIMULATION_PHASE","INSIDE DRIVER_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("DRIVER_RUN_PHASE","INSIDE DRIVER_RUN_PHASE before delay",UVM_HIGH)
		phase.raise_objection(this);
		#30;
		phase.drop_objection(this);
		`uvm_info("DRIVER_RUN_PHASE","INSIDE DRIVER_RUN_PHASE after delay",UVM_HIGH)
		forever begin
			seq_item_port.get_next_item(tx);
			tx.print();
			seq_item_port.item_done();
		end
	endtask : run_phase

	function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("DRIVER_EXTRACT_PHASE","INSIDE DRIVER_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("DRIVER_CHECK_PHASE","INSIDE DRIVER_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("DRIVER_report_PHASE","INSIDE DRIVER_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("DRIVER_FINAL_PHASE","INSIDE DRIVER_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase
endclass : ahb_driver
