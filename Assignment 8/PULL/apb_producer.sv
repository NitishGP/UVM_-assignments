
class apb_producer extends uvm_component;
	`uvm_component_utils(apb_producer)
	`NEW
	uvm_blocking_get_imp#(apb_tx,apb_producer) get_imp;
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		get_imp=new("get_imp",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
			endtask

	task get(output apb_tx tx);
			tx=apb_tx::type_id::create("tx");
			tx.randomize;
			$display("*****prod*****");
			tx.print();
	endtask


endclass
