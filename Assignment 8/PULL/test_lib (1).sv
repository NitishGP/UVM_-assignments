class apb_base_test extends uvm_test;
	`uvm_component_utils(apb_base_test)
	`NEW
	apb_env env;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=apb_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology;
	endfunction

endclass
