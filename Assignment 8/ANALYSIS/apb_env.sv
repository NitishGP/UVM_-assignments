class apb_env extends uvm_env;
	`uvm_component_utils(apb_env)
	`NEW
	apb_consumer cons;
	apb_producer prod;
	apb_subscriber sub1,sub2,sub3;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		cons=apb_consumer::type_id::create("cons",this);
		prod=apb_producer::type_id::create("prod",this);
		sub1=apb_subscriber::type_id::create("sub1",this);
		sub2=apb_subscriber::type_id::create("sub2",this);
		sub3=apb_subscriber::type_id::create("sub3",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		prod.ap_port.connect(sub1.ap_imp);
		prod.ap_port.connect(sub2.ap_imp);
		prod.ap_port.connect(sub3.ap_imp);
	endfunction
endclass
