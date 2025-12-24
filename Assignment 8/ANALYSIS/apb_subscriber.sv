class apb_subscriber extends uvm_component;
	`uvm_component_utils(apb_subscriber)
	int b;
	
	function new(string name="",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	apb_tx tx;
	uvm_analysis_imp #(apb_tx,apb_subscriber) ap_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap_imp=new("ap_imp",this);
	endfunction

	function void write(apb_tx t);
		$cast(tx,t);
		$display("*****%s*****",get_name);
		tx.print;
	endfunction

	
endclass
