
class apb_env extends uvm_env;
  `uvm_component_utils(apb_env)
  `NEW
  apb_agent agent;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent=apb_agent::type_id::create("agent",this);
  endfunction
  
endclass