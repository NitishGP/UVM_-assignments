
module apb_rtl(PCLK,PRESETn,PADDR,PSELx,PWRITE,PWDATA,PENABLE,PREADY,PRDATA);
	parameter 	WIDTH=8;
	parameter   DEPTH=8;
	localparam  PADDR_WIDTH=$clog2(DEPTH);
	input PCLK,PRESETn,PSELx,PWRITE,PENABLE;
	output reg  PREADY;
	input [PADDR_WIDTH-1:0] PADDR;
	input [WIDTH-1:0] PWDATA;
	output reg [WIDTH-1:0] PRDATA;

	reg [WIDTH-1:0] mem [DEPTH-1:0];
	integer i;

	always@(posedge PCLK  or negedge PRESETn )begin
		if(PRESETn)begin
			if(PENABLE)begin
					  PREADY<=1;
				if(PWRITE) mem[PADDR]<=PWDATA;
				else PRDATA<=mem[PADDR];
			end
			else begin
				PREADY<=0;
				PRDATA<=0;
			end
		end
		else begin
			PREADY<=0;
			PRDATA<=0;
			for(i=0;i<DEPTH;i++) mem[i]<=0;
		end
	end


endmodule

