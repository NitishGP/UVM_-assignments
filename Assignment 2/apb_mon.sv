
class apb_mon extends uvm_monitor;
	`uvm_component_utils(apb_mon)
	`new_component
	virtual apb_intf vif;
	uvm_analysis_port#(apb_tx) ap_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif);
		ap_port=new("ap_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("mon_run_phase","inside mon_run_phase",UVM_MEDIUM)
	endtask
endclass
