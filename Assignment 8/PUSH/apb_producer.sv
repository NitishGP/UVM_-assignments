
class apb_producer extends uvm_component;
	`uvm_component_utils(apb_producer)
	uvm_blocking_put_port #(apb_tx)put_port;
	apb_tx tx;
	`NEW

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_port=new("put_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this);
		repeat(5)begin
			tx=apb_tx::type_id::create("tx_prod");
			tx.randomize;
			tx.print();
			#1;
			put_port.put(tx);
		end
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,10);
	endtask

endclass
