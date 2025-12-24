
class apb_cov extends uvm_subscriber #(apb_tx);
	`uvm_component_utils(apb_cov)
	`new_component
//   uvm_put_imp #(apb_tx,apb_cov) cov_imp;
  
//   function void build();
//     cov_imp=new("cov_imp",this);
//   endfunction

//   task put(apb_tx t);
//     $display("+++++++++++++++"); 
//     t.print;
//   endtask
  
	function void write(apb_tx t);

	endfunction
endclass