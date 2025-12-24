class sample_drv extends uvm_driver #(sample_tx);
	
	`uvm_component_utils(sample_drv)
	virtual sample_interface vif; 
	
	`constructor
//     or
//function new(string name="",uvm_component parent=null);
//	super.new(name,parent);
//endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("drv_build_phase","inside drv_build_phase",UVM_MEDIUM)
		if(!uvm_config_db#(virtual sample_interface)::get(this,"","vif",vif))begin
			`uvm_error("DRV_BUILD_PHASE","VIRTUAL INTERFACE RETIEVAL FAILED IN DRV")
		end
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		`uvm_info("drv_connect_phase","inside drv_connect_phase",UVM_MEDIUM)
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("drv_run_phase","inside drv_run_phase",UVM_MEDIUM)
	endtask

endclass



