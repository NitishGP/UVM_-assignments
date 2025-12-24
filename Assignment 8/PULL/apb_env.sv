class apb_env extends uvm_env;
	`uvm_component_utils(apb_env)
	`NEW
	apb_consumer cons;
	apb_producer prod;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		cons=apb_consumer::type_id::create("cons",this);
		prod=apb_producer::type_id::create("prod",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		cons.get_port.connect(prod.get_imp);
	endfunction
endclass
