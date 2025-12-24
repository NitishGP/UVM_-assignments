
class apb_coverage extends uvm_subscriber#(apb_tx);
  `uvm_component_utils(apb_coverage)
  apb_tx tx;
  uvm_analysis_imp#(apb_tx,apb_coverage) ap_imp;
  
  covergroup apb_cg;
  	WR_RD : coverpoint tx.wr_rd; 
  	DATA : coverpoint tx.data; 
  	ADDR : coverpoint tx.addr;
  	SEL : coverpoint tx.sel; 
  endgroup
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    apb_cg=new;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap_imp=new("ap_imp",this);
  endfunction
  
  function void write(apb_tx t);
    $cast(tx,t);
    apb_cg.sample();
  endfunction
  
endclass