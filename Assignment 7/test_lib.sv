
class apb_base_test extends uvm_test;
  `uvm_component_utils(apb_base_test)
  seq_1wr_1rd seq;
  uvm_object_wrapper tx,drv,tx_n,drv_n;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  apb_env env;
  uvm_factory factory=uvm_factory::get();

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=apb_env::type_id::create("env",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
    factory.print();
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    seq=seq_1wr_1rd::type_id::create("seq");
    phase.raise_objection(this);
    seq.start(env.agent.sqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,10);
  endtask
endclass

class test_1wr_1rd extends apb_base_test;
  `uvm_component_utils(test_1wr_1rd)
  `NEW
  seq_1wr_1rd seq;

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    seq=seq_1wr_1rd::type_id::create("seq");
    phase.raise_objection(this);
    seq.start(env.agent.sqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,10);
  endtask
endclass

class test_APB_inst_override_by_type extends apb_base_test;
  `uvm_component_utils(test_APB_inst_override_by_type)
  `NEW
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    factory.set_inst_override_by_type(apb_driver::get_type(),apb_bad_driver::get_type(),"uvm_test_top.env.agent.*");
    drv=factory.find_override_by_type(apb_driver::get_type(),"uvm_test_top.env.agent.*");

    tx_n=factory.find_override_by_name("apb_tx",get_full_name());
    drv_n=factory.find_override_by_name("apb_driver",get_full_name());
//     $display("NAME::tx_type::%s \t drv_type::%s",tx_n.get_type_name(),drv_n.get_type_name());
  endfunction
  
  task run_phase(uvm_phase phase);
    factory.set_inst_override_by_type(apb_tx::get_type(),apb_bad_tx::get_type(),"uvm_test_top.env.agent.sqr.*");
    tx=factory.find_override_by_type(apb_tx::get_type(),"uvm_test_top.env.agent.sqr.*");
    $display("TYPE::tx_type::%s \t drv_type::%s",tx.get_type_name(),drv.get_type_name());
    super.run_phase(phase);
  endtask
endclass

class test_APB_inst_override_by_name extends apb_base_test;
  `uvm_component_utils(test_APB_inst_override_by_name)
  `NEW
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    factory.set_inst_override_by_name("apb_driver","apb_bad_driver","uvm_test_top.env.agent.*");
    drv=factory.find_override_by_type(apb_driver::get_type(),"uvm_test_top.env.agent.*");
  endfunction
  
  task run_phase(uvm_phase phase);
    factory.set_inst_override_by_name("apb_tx","apb_bad_tx","uvm_test_top.env.agent.sqr.*");
    
    tx=factory.find_override_by_type(apb_tx::get_type(),"uvm_test_top.env.agent.sqr.*");
    $display("TYPE::tx_type::%s \t drv_type::%s",tx.get_type_name(),drv.get_type_name());
    
    tx_n=factory.find_override_by_name("apb_tx",get_full_name());
    drv_n=factory.find_override_by_name("apb_driver",get_full_name());
//     $display("NAME::tx_type::%s \t drv_type::%s",tx_n.get_type_name(),drv_n.get_type_name());
    super.run_phase(phase);
  endtask
endclass

class test_APB_type_override_by_type extends apb_base_test;
  `uvm_component_utils(test_APB_type_override_by_type)
  `NEW
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    factory.set_type_override_by_type(apb_tx::get_type(),apb_bad_tx::get_type());
    factory.set_type_override_by_type(apb_driver::get_type(),apb_bad_driver::get_type());
    
    tx=factory.find_override_by_type(apb_tx::get_type(),get_full_name());
    drv=factory.find_override_by_type(apb_driver::get_type(),get_full_name());
    $display("TYPE::tx_type::%s \t drv_type::%s",tx.get_type_name(),drv.get_type_name());
    
    tx_n=factory.find_override_by_name("apb_tx",get_full_name());
    drv_n=factory.find_override_by_name("apb_driver",get_full_name());
    $display("NAME::tx_type::%s \t drv_type::%s",tx_n.get_type_name(),drv_n.get_type_name());
  endfunction
endclass

class test_APB_type_override_by_name extends apb_base_test;
  `uvm_component_utils(test_APB_type_override_by_name)
  `NEW
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    factory.set_type_override_by_name("apb_tx","apb_bad_tx");
    factory.set_type_override_by_name("apb_driver","apb_bad_driver");
    
    //first write type, then name only
    //otherwise recursive error
    tx=factory.find_override_by_type(apb_tx::get_type(),get_full_name());
    drv=factory.find_override_by_type(apb_driver::get_type(),get_full_name());
    $display("TYPE::tx_type::%s \t drv_type::%s",tx.get_type_name(),drv.get_type_name());
    
    tx_n=factory.find_override_by_name("apb_tx",get_full_name());
    drv_n=factory.find_override_by_name("apb_driver",get_full_name());
    $display("NAME::tx_type::%s \t drv_type::%s",tx_n.get_type_name(),drv_n.get_type_name());
    
  endfunction

endclass