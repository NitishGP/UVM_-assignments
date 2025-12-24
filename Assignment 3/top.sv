module top;

	bit clk,rst;
	apb_intf pif(clk,rst);

	always #5 clk=~clk;
	
	apb_rtl #(.WIDTH(`WIDTH), .DEPTH(`DEPTH)) dut(.PCLK   (pif.clk),
					.PRESETn(pif.rst),
					.PADDR  (pif.PADDR),
					.PSELx  (pif.PSELx),
					.PWRITE (pif.PWRITE),
					.PWDATA (pif.PWDATA),
					.PENABLE(pif.PENABLE),
					.PREADY (pif.PREADY),
					.PRDATA (pif.PRDATA));

	initial begin
		uvm_config_db#(virtual apb_intf)::set(uvm_root::get(),"*","vif",pif);
	end

	initial begin
		clk=0;
		rst=0;
		reset();
		@(posedge clk);
		rst=1;
	end

	initial begin
      $dumpfile("dump.vcd"); $dumpvars;
		run_test("apb_test_lib");
	end

	task reset();
		pif.PENABLE=0;
		pif.PWRITE=0;
		pif.PWDATA=0;
		pif.PADDR=0;
		pif.PSELx=0;
	endtask
endmodule