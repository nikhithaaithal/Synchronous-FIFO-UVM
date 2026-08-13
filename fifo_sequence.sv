
/*class fifo_sequence extends uvm_sequence#(trans);
`uvm_object_utils(fifo_sequence)
 function new(string name="fifo_sequence");
  super.new(name);
 endfunction
endclass*/

class fifo_seq_wr extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_wr)
 function new(string name="fifo_seq_wr");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
   repeat(3)begin
   start_item(req);
    assert(req.randomize() with {wr_cs ==1;wr_en==1;});
   finish_item(req);
   end
 endtask
endclass

class fifo_seq_rd extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_rd)
 function new(string name="fifo_seq_rd");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
 repeat(3)begin
   start_item(req);
    assert(req.randomize() with {rd_cs ==1;rd_en==1;});
   finish_item(req);
  end
 endtask
endclass
