
class apb_test_lib extends uvm_test;
	`uvm_component_utils(apb_test_lib)
	apb_env env;
	
	`new_component

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("test_build_phase","inside test_build",UVM_MEDIUM)
		env=apb_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		`uvm_info("test_elaboration_phase","inside test_elaboration_phase",UVM_MEDIUM)
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("test_run_phase","inside test_run_phase",UVM_MEDIUM)
	endtask


	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info("test_report_phase","inside test_report_phase",UVM_MEDIUM)
	endfunction
endclass

class test_1wr extends apb_test_lib;
	`uvm_component_utils(test_1wr)
	`new_component
	seq_1wr seq;

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq=seq_1wr::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass

class test_1wr_1rd extends apb_test_lib;
	`uvm_component_utils(test_1wr_1rd)
	`new_component
	seq_1wr_1rd seq;

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq=seq_1wr_1rd::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass

class test_nwr_nrd extends apb_test_lib;
	`uvm_component_utils(test_nwr_nrd)
	`new_component
	seq_nwr_nrd seq;

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		seq=seq_nwr_nrd::type_id::create("seq");
		phase.raise_objection(this);
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,100);
	endtask
endclass
