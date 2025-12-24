
class apb_producer extends uvm_component;
	`uvm_component_utils(apb_producer)
	`NEW
	apb_tx tx;
	uvm_blocking_put_port#(apb_tx) put_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_port=new("put_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		repeat(3)begin
			tx=apb_tx::type_id::create("tx");
			tx.randomize;
			#5;
			$display("******producer******");
			tx.print;
			put_port.put(tx);
		end
	endtask

endclass
