
class apb_producer extends uvm_component;
	`uvm_component_utils(apb_producer)
	`NEW
	uvm_analysis_port #(apb_tx) ap_port;
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap_port=new("ap_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this);
		repeat(2)begin
			tx=apb_tx::type_id::create("tx");
			tx.randomize;
			$display("******prod*****");
			ap_port.write(tx);
			#1;
		end
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,10);
	endtask

endclass
