

class apb_mon extends uvm_monitor;
	`uvm_component_utils(apb_mon)
	`new_component
	virtual apb_intf vif;
	uvm_analysis_port#(apb_tx) ap_port;
  	apb_tx tx,tx_t;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif);
		ap_port=new("ap_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("mon_run_phase","inside mon_run_phase",UVM_MEDIUM)
      forever begin
        		@(vif.mon_cb);
			  	if(vif.mon_cb.PENABLE==1 && vif.mon_cb.PREADY==1)begin
      	  		tx=apb_tx::type_id::create("mon_tx");
      	  		tx.PADDR=vif.mon_cb.PADDR;
      	  		tx.PWRITE=vif.mon_cb.PWRITE;
      	  		if(vif.mon_cb.PWRITE) tx.PWDATA=vif.mon_cb.PWDATA;
      	  		else tx.PRDATA=vif.mon_cb.PRDATA;
      	  		tx.PSELx=vif.mon_cb.PSELx;
					ap_port.write(tx);
					tx.print();
				end
		  end
	endtask
endclass
