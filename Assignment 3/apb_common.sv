`define WIDTH 16
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
`define COUNT 8

`define new_component\
			function new(string name="",uvm_component parent=null);\
				super.new(name,parent);\
			endfunction


`define new_object\
			function new(string name="");\
				super.new(name);\
			endfunction