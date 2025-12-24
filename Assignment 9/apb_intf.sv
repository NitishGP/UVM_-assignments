interface apb_intf(input reg clk);
  int addr;
  int data;
  bit wr_rd;
  bit[1:0] sel;  
endinterface