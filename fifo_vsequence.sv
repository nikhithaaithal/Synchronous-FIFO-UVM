class fifo_vsequence extends uvm_sequence;
 `uvm_object_utils(fifo_vsequence)
  `uvm_declare_p_sequencer(fifo_vsequencer)
 function new(string name="fifo_vsequence");
  super.new(name);
 endfunction

 task body();
 fifo_seq_wr wr_seq;
 fifo_seq_rd rd_seq;
 wr_seq=fifo_seq_wr::type_id::create("wr_seq");
 rd_seq=fifo_seq_rd::type_id::create("rd_seq");
 wr_seq.start(p_sequencer.fifo_wr_seqr);
 rd_seq.start(p_sequencer.fifo_rd_seqr);
endtask
endclass
