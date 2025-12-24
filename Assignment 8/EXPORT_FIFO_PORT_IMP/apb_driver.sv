
class apb_driver extends uvm_component;
	`uvm_component_utils(apb_driver)
	`NEW
	uvm_blocking_get_port #(apb_tx) get_port;
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		get_port=new("get_port",this);
	endfunction

	task run_phase(uvm_phase phase);
	super.run_phase(phase);
		get_port.get(tx);
		$display("******DRV******");
		tx.print();
	endtask
endclass
