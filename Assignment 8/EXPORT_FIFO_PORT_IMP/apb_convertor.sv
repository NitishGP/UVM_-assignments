class apb_convertor extends uvm_component;
	`uvm_component_utils(apb_convertor)
	`NEW

	uvm_blocking_get_port #(apb_tx) c1_port;
	uvm_blocking_put_port #(apb_tx) c2_port;
	apb_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		c1_port=new("c1_port",this);
		c2_port=new("c2_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin
			c1_port.get(tx);
		//	$display("*******CONV********");
			tx.print;
			c2_port.put(tx);
		end
	endtask

endclass
