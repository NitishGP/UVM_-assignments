class apb_base_seq extends uvm_sequence#(apb_tx);
  `uvm_object_utils(apb_base_seq)
  `NEW_OBJ
  int seq_var=1000;
  int seq_get,seq_read;
  int seq_set=2;
endclass

class seq_1wr_1rd extends apb_base_seq;
  `uvm_object_utils(seq_1wr_1rd)
  `NEW_OBJ
  int temp;
  
  task body();
    uvm_config_db#(int)::set(uvm_root::get(),"*","CDB-4",seq_var);
    uvm_resource_db#(int)::set("SEQ","SEQ_SET",seq_set,null);
    
    
    `uvm_do_with(req,{req.wr_rd==1;})
    temp=req.addr;
    `uvm_do_with(req,{req.wr_rd==0;req.addr==temp;})
  endtask
  
  task post_body();
    assert(uvm_config_db#(int)::get(null,get_full_name(),"CDB-2",seq_get));
    $display("seq_get:%0d",seq_get);
    ->e;
    
    assert(uvm_resource_db#(int)::read_by_name("DRV","DRV_SET",seq_read,null));
    $display("from env seq_read:%d",seq_read);
  endtask
endclass