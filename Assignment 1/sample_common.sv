
parameter WIDTH=8;
parameter DEPTH=8;
parameter ADDR_WIDTH=$clog2(DEPTH);

`define constructor\
		  function new(string name="",uvm_component parent=null);\
				super.new(name,parent);\
		  endfunction
`define constructor_object\
		  function new(string name="");\
				super.new(name);\
		  endfunction
