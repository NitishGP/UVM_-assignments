
class apb_monitor extends uvm_monitor;
  `NEW
  
  uvm_analysis_port#(apb_tx) ap;
  virtual apb_intf vif;
  apb_tx tx;
  int q21;
  
  `uvm_component_utils_begin(apb_monitor)
  `uvm_field_int(q21,UVM_DEFAULT)
  `uvm_component_utils_end
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif));
    ap=new("ap",this);
    
    
    //getting via auto retrieval
    //var q21 is same when it was set value andddd register q21 in factory
    $display("*********  monitor output for %s is %0d. *********",get_full_name,q21);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      tx=apb_tx::type_id::create("tx");
      tx.wr_rd=vif.wr_rd;
      tx.data=vif.data;
      tx.addr=vif.addr;
      tx.sel=vif.sel;
      tx.print();
      ap.write(tx);
    end
  endtask
endclass