class test_lib extends uvm_test;
	
	`uvm_component_utils(test_lib)

	sample_env env;

	function new(string name="",uvm_component parent= null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("test_lib_build","inside test_build_phase",UVM_MEDIUM)
		env=sample_env::type_id::create("env",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("test_lib_connect","inside test_connect_phase",UVM_MEDIUM)
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("test_lib_end_of_elaboration_phase","inside test_end_of_elaboaration_phase",UVM_MEDIUM)
		uvm_top.print_topology();
	endfunction

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		`uvm_info("test_lib_start_of_simulation_phase","inside test_start_of_sim_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("test_lib_run_phase","inside test_run_phase",UVM_MEDIUM)
	endtask

	function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("tset_lib_extract_phase","inside test_extract_phase",UVM_MEDIUM)
	endfunction

	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("test_lib_check_phase","inside test_check_phase",UVM_MEDIUM)
	endfunction

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("test_lib_report_phase","inside test_report_phase",UVM_MEDIUM)
	endfunction

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("test_lib_final_phase","inside test_final_phase",UVM_MEDIUM)
	endfunction
endclass


class test_1wr extends test_lib;
	
	`uvm_component_utils(test_1wr)

	`constructor
	
	task run_phase (uvm_phase phase);
		
	endtask

endclass
