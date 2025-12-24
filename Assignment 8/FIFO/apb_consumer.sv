
class apb_consumer extends uvm_component;
	`uvm_component_utils(apb_consumer)
	`NEW
	uvm_blocking_get_port #(apb_tx) get_port;
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		get_port=new("get_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this);
		repeat(3)begin
			get_port.get(tx);
			#7;
			$display("******consumer******");
			tx.print;
		end
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,"7");
	endtask

	//task get(output apb_tx t);
	//	repeat(4)begin
	//		$cast(tx,t);
	//		#7;
	//		$display("******consumer******");
	//		tx.print;
	//	end
	//endtask

endclass
