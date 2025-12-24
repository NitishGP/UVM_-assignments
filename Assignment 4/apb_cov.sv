
class apb_cov extends uvm_subscriber #(apb_tx);
	`uvm_component_utils(apb_cov)
  	 apb_tx tx;
// 	`new_component
  
  covergroup apb_cvg;
  	PWRITE_CP : coverpoint tx.PWRITE;
    PWDATA_CP : coverpoint tx.PWDATA{
      bins wlo={['b0:'b1]};
    }
    PRDATA_CP : coverpoint tx.PRDATA{
      bins rlo={['b0:'b1]};
      
    }
    PWRITE_CPxPWDATA_CP : cross PWRITE_CP,PWDATA_CP;
  endgroup
  
  function new(string name="",uvm_component parent=null);
    super.new(name,parent);
    apb_cvg=new;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

	function void write(apb_tx t);
      assert($cast(tx,t));
      apb_cvg.sample();
	endfunction
endclass
