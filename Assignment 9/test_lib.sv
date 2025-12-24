
class apb_base_test extends uvm_test;
  `uvm_component_utils(apb_base_test)
  int test_var=10;
  int test_get,test_read;
  int test_set=200;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction
  apb_env env;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this,"*.*.*.*","CDB-1",test_var); // *this cant use
    // *.* this and child cant use, hierarchical grand child and rest can
    //*.*.* child,grandchild cant , rest from great grand child can
    
    
    env=apb_env::type_id::create("env",this);
    
    uvm_resource_db#(int)::set("TEST","TEST_SET",test_set,this);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    
    assert(uvm_config_db#(int)::get(this,"","CDB-4",test_get));
    $display("from seq tet_get:%0d",test_get);
    
    assert(uvm_resource_db#(int)::read_by_type("SEQ",test_read,this));
    $display("type from seq test_read:%0d",test_read);
    
    assert(uvm_resource_db#(int)::read_by_name("SEQ","SEQ_SET",test_read));
    $display("fom seq test_read:%0d",test_read);
  endfunction
  
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
    phase.phase_done.set_drain_time(this,20);
  endtask
endclass