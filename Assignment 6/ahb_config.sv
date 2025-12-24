
`define NEW\
	function new (string name, uvm_component parent);\
		super.new(name,parent);\
	endfunction : new


`define	NEW_OBJ\
	function new(string name="");\
		super.new(name);\
	endfunction : new
