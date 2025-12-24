
class apb_env extends uvm_env;
  `uvm_component_utils(apb_env)
  `NEW
  apb_agent agent,agent0,agent1,agent2;
  
  int env_var=100;
  int env_get,env_read,q21;
  int env_set=2000;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this,"*","CDB-2",env_var);
    agent=apb_agent::type_id::create("agent",this);
    agent0=apb_agent::type_id::create("agent0",this);
    agent1=apb_agent::type_id::create("agent1",this);
    agent2=apb_agent::type_id::create("agent2",this);
    
   	q21=5;
    uvm_config_db#(int)::set(this, "agent*","q21",q21);
    q21=25;
    uvm_config_db#(int)::set(this,"agent1*","q21",q21);
    q21=35;
    uvm_config_db#(int)::set(this,"agent2*","q21",q21);
    q21=45;
    uvm_config_db#(int)::set(this,"agent0*","q21",q21);

    assert(uvm_config_db#(int)::get(this,"","CDB-1",env_get));
    $display("env_get:%0d",env_get);


    uvm_resource_db#(int)::set("ENV","ENV_SET",env_set,this);
    assert(uvm_resource_db#(int)::read_by_name("TEST","TEST_SET",env_read));
    $display("from test env_read:%0d",env_read);


    fork //not working
      begin
        uvm_config_db#(int)::wait_modified(this,"","CDB-3"); // to void race condition
        $display("*******************************");
        assert(uvm_config_db#(int)::get(this,"","CDB-3",env_get));
        $display("from drv to env after wait_modifiedenv_get:%0d",env_get);
      end
    join_none
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    uvm_config_db#(int)::wait_modified(this,"","CDB-3"); //its a task and returns nothing and called in task only
  endtask

endclass