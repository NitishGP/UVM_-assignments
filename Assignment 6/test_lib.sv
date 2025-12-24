
class ahb_base_test extends uvm_test;
	`uvm_component_utils(ahb_base_test)
	uvm_factory factory=uvm_factory::get();
	string testprint;
	uvm_table_printer printer;
	ahb_base_sequence seq;

	`NEW
	
	ahb_env env;

	function void build_phase(uvm_phase phase);
`uvm_info("BASE_TEST_BUILD_PHASE","INSIDE BASE_TEST_BUILD_PHASE",UVM_MEDIUM)
		super.build_phase(phase);
		env=ahb_env::type_id::create("env",this);
		seq=ahb_base_sequence::type_id::create("seq");

		uvm_config_db#(uvm_object_wrapper)::set(this,"uvm_test_top.env.agent.sqr.*","default sequence",ahb_base_sequence::get_type());
		printer=new();
		this.set_report_verbosity_level(UVM_NONE);
	
		env.set_report_verbosity_level(UVM_NONE);



		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_BUILD_PHASE_VERBOSITY","INSIDE TEST_BUILD_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : build_phase

	function void connect_phase(uvm_phase phase );
`uvm_info("BASE_TEST_CONNECT_PHASE","INSIDE BASE_TEST_CONNECT_PHASE",UVM_MEDIUM)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_CONNECT_PHASE_VERBOSITY","INSIDE TEST_CONNECT_PHASE UVM_DEBUG",UVM_DEBUG)


		env.agent.set_report_verbosity_level(UVM_NONE);
		env.agent.sqr.set_report_verbosity_level(UVM_NONE);
		env.agent.drv.set_report_verbosity_level(UVM_NONE);
		env.agent.mon.set_report_verbosity_level(UVM_NONE);
		env.agent.cov.set_report_verbosity_level(UVM_NONE);
	endfunction : connect_phase

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
`uvm_info("BASE_TEST_END_OF_ELABORATION_PHASE","INSIDE BASE_TEST_END_OF_ELABORATION_PHASE_PHASE",UVM_MEDIUM)
		uvm_top.print_topology();
		factory.print();
		testprint=sprint(printer);
		`uvm_info("PRINTER OP",testprint,UVM_NONE)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_EOE_PHASE_VERBOSITY","INSIDE TEST_EOE_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : end_of_elaboration_phase

	function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
`uvm_info("BASE_TEST_START_OF_SIMULATION_PHASE INFO","INSIDE BASE_TEST_START_OF_SIMULATION_PHASE",UVM_MEDIUM)
`uvm_error("BASE_TEST_START_OF_SIMULATION_PHASE ERROR","INSIDE BASE_TEST_START_OF_SIMULATION_PHASE ERROR MACRO")
`uvm_warning("BASE_TEST_START_OF_SIMULATION_PHASE WARN","INSIDE BASE_TEST_START_OF_SIMULATION_PHASE WARN MACRO")
//`uvm_fatal("BASE_TEST_START_OF_SIMULATION_PHASE FATAL","INSIDE BASE_TEST_START_OF_SIMULATION_PHASE FATAL MACRO")
	endfunction : start_of_simulation_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_RUN_PHASE_VERBOSITY","INSIDE TEST_RUN_PHASE UVM_DEBUG",UVM_DEBUG)

		`uvm_info("BASE_TEST_RUN_PHASE","INSIDE BASE_TEST_RUN_PHASE ",UVM_MEDIUM)
		phase.raise_objection(this);
		#10;
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
		#10;
		phase.phase_done.set_drain_time(this,50);

	endtask : run_phase

function void extract_phase(uvm_phase phase);
		super.extract_phase(phase);
		`uvm_info("BASE_TEST_EXTRACT_PHASE","INSIDE BASE_TEST_EXTRACT_PHASE",UVM_MEDIUM)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_EXTRACT_PHASE_VERBOSITY","INSIDE TEST_EXTRACT_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : extract_phase
	
	function void check_phase(uvm_phase phase);
		super.check_phase(phase);
		`uvm_info("BASE_TEST_CHECK_PHASE","INSIDE BASE_TEST_CHECK_PHASE",UVM_MEDIUM)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_CHECK_PHASE_VERBOSITY","INSIDE TEST_CHECK_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : check_phase

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("BASE_TEST_report_PHASE","INSIDE BASE_TEST_report_PHASE",UVM_MEDIUM)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_REPORT_PHASE_VERBOSITY","INSIDE TEST_REPORT_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : report_phase

	function void final_phase(uvm_phase phase);
		super.final_phase(phase);
		`uvm_info("BASE_TEST_FINAL_PHASE","INSIDE BASE_TEST_FINAL_PHASE",UVM_MEDIUM)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_NONE",UVM_NONE)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_LOW",UVM_LOW)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_MEDIUM",UVM_MEDIUM)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_HIGH",UVM_HIGH)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_FULL",UVM_FULL)
		`uvm_info("TEST_FINAL_PHASE_VERBOSITY","INSIDE TEST_FINAL_PHASE UVM_DEBUG",UVM_DEBUG)

	endfunction : final_phase


endclass : ahb_base_test
