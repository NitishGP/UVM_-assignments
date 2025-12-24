
module top;

	ahb_intf pif();

	initial begin
		uvm_config_db#(virtual ahb_intf)::set(uvm_root::get(),"*","vif",pif);
	end
	initial begin
		run_test("ahb_base_test");
	end
endmodule : top
