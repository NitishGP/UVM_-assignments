class apb_driver extends uvm_driver#(apb_tx);
  `uvm_component_utils(apb_driver)
  `NEW
  virtual apb_intf vif;
  int drv_var=10000;
  int drv_get,drv_read;
  int drv_set=20000;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this,"*","CDB-3",drv_var);
    uvm_resource_db#(int)::set("DRV","DRV_SET",drv_set,this);
    
    assert(uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif));
    
    
    assert(uvm_config_db#(int)::get(this,"","CDB-1",drv_get));
    $display("drv_get:%0d",drv_get);
    
    assert(uvm_resource_db#(int)::read_by_name("ENV","ENV_SET",drv_read,this));
    $display("from env drv_read:%0d",drv_read);
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      	#10;
      drive(req);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(apb_tx tx);
    @(posedge vif.clk);
    vif.wr_rd<=tx.wr_rd; 
    vif.data<=tx.data; 
    vif.addr<=tx.addr; 
    vif.sel<=tx.sel; 
    
  endtask
  
endclass