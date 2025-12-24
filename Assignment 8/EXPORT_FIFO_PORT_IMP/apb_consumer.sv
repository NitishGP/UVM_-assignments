
class apb_consumer extends uvm_component;
	`uvm_component_utils(apb_consumer)
	`NEW
	apb_driver drv;
	uvm_tlm_fifo #(apb_tx) fifo;
	uvm_blocking_put_export #(apb_tx) cons_export;
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drv=apb_driver::type_id::create("drv",this);
		fifo=new("fifo",this);
		cons_export=new("cons_export",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//E
		this.cons_export.connect(fifo.put_export);

		//F
		drv.get_port.connect(fifo.get_export);
	endfunction
	

endclass
