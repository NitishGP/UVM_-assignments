
class apb_cov extends uvm_subscriber #(apb_tx);
	`uvm_component_utils(apb_cov)
	`new_component

	function void write(apb_tx t);

	endfunction
endclass
