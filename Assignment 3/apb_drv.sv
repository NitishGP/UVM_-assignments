
class apb_drv extends uvm_driver #(apb_tx);
	`uvm_component_utils(apb_drv)
	`new_component
	virtual apb_intf vif;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("drv_build_phase","inside drv_build_phase",UVM_MEDIUM)
		if(!uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif))
		`uvm_error("DRV_BUILD_PHASE","VIRTUAL INTERFACE RETIEVAL FAILED IN DRV")
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("drv_run_phase","inside drv_run_phase",UVM_MEDIUM)
		forever begin
			seq_item_port.get_next_item(req);
			`uvm_info("debug drv","inside run_drv before drive_tx",UVM_DEBUG)
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(apb_tx tx);

			`uvm_info("debug drive_tx","inside drive_tx before clk",UVM_DEBUG)
		@(vif.drv_cb);
		vif.drv_cb.PENABLE<=1;
		vif.drv_cb.PWRITE<=tx.PWRITE;
		vif.drv_cb.PADDR<=tx.PADDR;
		if(tx.PWRITE) vif.drv_cb.PWDATA<=tx.PWDATA;
		else vif.drv_cb.PWDATA<=0;
			`uvm_info("debug drive_tx","inside drive_tx after clk",UVM_DEBUG)
		
		wait(vif.drv_cb.PREADY);
		//@(vif.drv_cb);
		if(!tx.PWRITE) tx.PRDATA=vif.drv_cb.PRDATA;
		else tx.PRDATA=0;
			`uvm_info("debug drive_tx","inside drive_tx after wait",UVM_DEBUG)

		
		vif.drv_cb.PENABLE<=0;
		vif.drv_cb.PWRITE <=0;
		vif.drv_cb.PADDR  <=0;
		vif.drv_cb.PWDATA <=0;
	
	endtask

endclass