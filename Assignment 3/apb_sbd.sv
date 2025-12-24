
class apb_sbd extends uvm_scoreboard;
	`uvm_component_utils(apb_sbd)
	`new_component
	uvm_analysis_imp#(apb_tx,apb_sbd) sbd_export;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sbd_export=new("sbd_export",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
	endtask

	function void write(apb_tx tx);

	endfunction
endclass