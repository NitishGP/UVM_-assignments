//oveeride inst component in build_phase
//object/sequence in run_phase
module top;
  reg clk=0;
  apb_intf pif(clk);
  
  always #5 clk=~clk;
  
  initial uvm_config_db#(virtual apb_intf)::set(null,"*","vif",pif);
  
  initial begin
    run_test("test_APB_inst_override_by_type");
  end
endmodule