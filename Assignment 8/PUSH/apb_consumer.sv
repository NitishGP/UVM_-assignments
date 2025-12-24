
class apb_consumer extends uvm_component;
	`uvm_component_param_utils(apb_consumer)
	uvm_blocking_put_imp #(apb_tx,apb_consumer)put_imp;
	apb_tx t;
	`NEW

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_imp=new("put_imp",this);
	endfunction

	task put(apb_tx tx);
		$cast(t,tx);
		$display("***********CONSUMER*************");
		t.print();
	endtask

endclass
