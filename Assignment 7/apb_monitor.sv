
class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)
  `NEW
  
  uvm_analysis_port#(apb_tx) ap;
  virtual apb_intf vif;
  apb_tx tx;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif));
    ap=new("ap",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      tx=apb_tx::type_id::create("tx");
      tx.wr_rd=vif.wr_rd;
      tx.data=vif.data;
      tx.addr=vif.addr;
      tx.sel=vif.sel;
//       $display("********MON********");
//       tx.print();
      ap.write(tx);
    end
  endtask
endclass