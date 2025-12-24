
interface ahb_intf();
	int addr;
	int dataQ[$];
	bit wr_rd;
	bit[1:0] burst_type;

endinterface : ahb_intf
