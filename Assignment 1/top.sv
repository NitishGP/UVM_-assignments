
module top;
	
	bit clk,rst;
	sample_interface pif(clk,rst);
	
	always #5 clk=~clk;

	initial begin
		uvm_config_db#(virtual sample_interface)::set(uvm_root::get(),"*","vif",pif);
	end

	initial begin
		run_test("test_lib");
	end
endmodule
