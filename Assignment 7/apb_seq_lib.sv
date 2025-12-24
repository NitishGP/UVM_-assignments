class apb_base_seq extends uvm_sequence#(apb_tx);
  `uvm_object_utils(apb_base_seq)
  `NEW_OBJ
endclass

class seq_1wr_1rd extends apb_base_seq;
  `uvm_object_utils(seq_1wr_1rd)
  `NEW_OBJ
  int temp;
  
  task body();
    
    `uvm_do_with(req,{req.wr_rd==1;})
    temp=req.addr;
    req.body();
    `uvm_do_with(req,{req.wr_rd==0;req.addr==temp;})
    req.body();
  endtask
endclass