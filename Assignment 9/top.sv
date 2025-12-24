
module top;
  reg clk=0;
  apb_intf pif(clk);
  int top_get,top_set,top_read;
  
  always #5 clk=~clk;
  
  initial begin
    top_set=20;
    uvm_config_db#(virtual apb_intf)::set(null,"*","vif",pif);
    
    uvm_resource_db#(int)::set("TOP","TOP_SET",top_set);
    wait(e.triggered);
    
    assert(uvm_config_db#(int)::get(null,"","CDB-4",top_get));
           $display("top_get:%0d",top_get);
    
    assert(uvm_resource_db#(int)::read_by_type("SEQ",top_read));
    $display("type from seq top_read:%0d",top_read);
    
    assert(uvm_resource_db#(int)::read_by_name("SEQ","SEQ_SET",top_read));
    $display("from seq top_read:%0d",top_read);
  end
  initial begin
    run_test("apb_base_test");
  end
endmodule