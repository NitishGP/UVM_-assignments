class apb_driver extends uvm_driver#(apb_tx);
  `uvm_component_utils(apb_driver)
  `NEW
  virtual apb_intf vif;
  uvm_object_wrapper tx,tx_n;
  uvm_factory factory=uvm_factory::get();
  uvm_component parent;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    assert(uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif));
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    parent=get_parent();
    //q13,14
    tx=factory.find_override_by_type(apb_tx::get_type(),get_full_name());
    tx_n=factory.find_override_by_name("apb_tx",get_full_name());
//     $display("tx_name::%s \t drv_name::%s",tx_n.get_type_name(),tx.get_type_name());
    
    //q15
    `uvm_info("FULL_NAME",$sformatf("%s ",get_full_name()),UVM_NONE)
    `uvm_info("FULL_NAME",$sformatf("%s ",get_name()),UVM_NONE)
    
    
    parent=get_parent();
    `uvm_info("mon path from drv",{parent.get_full_name(),".mon"},UVM_NONE)
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    `uvm_info("DRV_RUN","DRIV is running",UVM_MEDIUM)
    forever begin
      seq_item_port.get_next_item(req);
      	#10;
      drive(req);
      req.print();
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

class apb_bad_driver extends apb_driver;
  `uvm_component_utils(apb_bad_driver)
  `NEW
  
  task run_phase(uvm_phase phase);
    `uvm_warning("BAD_DRV_RUN","BAD_DRIV is running")
    forever begin
      seq_item_port.get_next_item(req);
      	#10;
      drive(req);
      req.print();
      seq_item_port.item_done();
    end
  endtask
  
endclass