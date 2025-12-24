
class apb_stimulus extends uvm_component;
	`uvm_component_utils(apb_stimulus)
	`NEW
	uvm_blocking_put_port#(apb_tx) put_port; 
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_port=new("put_port",this);
	endfunction

	task run_phase(uvm_phase phase);
	super.run_phase(phase);
		phase.raise_objection(this);
		repeat(2)begin
			tx=apb_tx::type_id::create("tx");
			tx.randomize;
			$display("*********STIM*********");
			put_port.put(tx);
			tx.print();
		end
		phase.drop_objection(this);
		phase.phase_done.set_drain_time(this,10);
	endtask

//	task get(output apb_tx tx);
//		phase.drop_objection(this);
//			tx=apb_tx::type_id::create("tx");
//			tx.randomize;
//			$display("*********STIM*********");
//			put_port.put(tx);
//			tx.print();		
//		phase.drop_objection(this);
//		phase.phase_done.set_drain_time(this,10);
//	endtask
endclass
