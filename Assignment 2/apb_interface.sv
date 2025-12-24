
interface apb_intf(input bit clk,rst);
   logic [`ADDR_WIDTH-1:0] PADDR;  
   logic PSELx ; 
   logic PWRITE; 
   logic [`WIDTH-1:0] PWDATA; 
   logic PENABLE;
   logic PREADY; 
	logic [`WIDTH-1:0] PRDATA; 

	clocking drv_cb@(posedge clk);
		default  input #0 output #0; 
		output	PADDR;
		output	PSELx;
		output	PWDATA;
		output	PWRITE;
		output	PENABLE;
	
		input PREADY;
		input PRDATA;
	endclocking
	
	
	clocking mon_cb@(posedge clk);
		default  input #0; 
		input	PADDR;
		input	PSELx;
		input	PWDATA;
		input	PWRITE;
		input	PENABLE;
		input PREADY;
		input PRDATA;
	endclocking

endinterface
