
class apb_producer extends uvm_component;
	`uvm_component_utils(apb_producer)
	`NEW
	apb_stimulus stim;
	apb_convertor conv;
	uvm_tlm_fifo #(apb_tx) fifo;
	uvm_blocking_put_port #(apb_tx) prod_port;
	

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		stim=apb_stimulus::type_id::create("stim",this);
		conv=apb_convertor::type_id::create("conv",this);
		fifo=new("fifo",this);
		prod_port=new("prod_port",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		//A
		stim.put_port.connect(fifo.put_export);

		//B
		conv.c1_port.connect(fifo.get_export);

		//C
		conv.c2_port.connect(this.prod_port);
	endfunction

endclass
