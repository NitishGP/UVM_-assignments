
class ahb_base_test extends uvm_test;
	`uvm_component_utils(ahb_base_test)
	uvm_factory factory=uvm_factory::get();
	string testprint;
	uvm_table_printer printer;

	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction : new

	ahb_env env;

	function void build_phase(uvm_phase phase);
`uvm_info("BASE_TEST_BUILD_PHASE","INSIDE BASE_TEST_BUILD_PHASE",UVM_MEDIUM)
		super.build_phase(phase);
		env=ahb_env::type_id::create("env",this);
		uvm_config_db#(uvm_object_wrapper)::set(this,"uvm_test_top.env.agent.sqr.*","default sequence",ahb_base_sequence::get_type());
		printer=new();
	endfunction : build_phase

	function void connect_phase(uvm_phase phase );
`uvm_info("BASE_TEST_CONNECT_PHASE","INSIDE BASE_TEST_CONNECT_PHASE",UVM_MEDIUM)
		super.connect_phase(phase);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("BASE_TEST_END_OF_ELABORATION_PHASE","INSIDE BASE_TEST_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
		uvm_top.print_topology();
		factory.print();
		testprint=sprint(printer);
		`uvm_info("PRINTER OP",testprint,UVM_NONE)
	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("BASE_TEST_START_OF_SIMULATION_PHASE","INSIDE BASE_TEST_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("BASE_TEST_RUN_PHASE","INSIDE BASE_TEST_RUN_PHASE ",UVM_MEDIUM)
		phase.raise_objection(this);
		#10;

		phase.drop_objection(this);
		#10;
		phase.phase_done.set_drain_time(this,50);

	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("BASE_TEST_EXTRACT_PHASE","INSIDE BASE_TEST_EXTRACT_PHASE",UVM_MEDIUM)
	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("BASE_TEST_CHECK_PHASE","INSIDE BASE_TEST_CHECK_PHASE",UVM_MEDIUM)
	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("BASE_TEST_report_PHASE","INSIDE BASE_TEST_report_PHASE",UVM_MEDIUM)
	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("BASE_TEST_FINAL_PHASE","INSIDE BASE_TEST_FINAL_PHASE",UVM_MEDIUM)
	endfunction : final_phase


endclass : ahb_base_test
