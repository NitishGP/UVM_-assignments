class sample_mon extends uvm_monitor; 
	
	`uvm_component_utils(sample_mon)
	
	virtual sample_interface vif;
	uvm_analysis_port #(sample_tx) ap_port;
	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("mon_build_phase","inside mon_build_phase",UVM_MEDIUM)
		ap_port=new("ap_port",this);
		uvm_config_db#(virtual sample_interface)::get(this,"","vif",vif);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("mon_connect_phase","inside mon_connect_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("mon_run_phase","inside mon_run_phase",UVM_MEDIUM)
	endtask

endclass



