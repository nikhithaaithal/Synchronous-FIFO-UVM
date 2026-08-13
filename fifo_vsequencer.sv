class fifo_vsequencer extends uvm_sequencer#(trans);
 `uvm_component_utils(fifo_vsequencer)
 function new(string name="fifo_vsequencer",uvm_component parent);
  super.new(name,parent);
 endfunction
fifo_sequencer_wr fifo_wr_seqr;
fifo_sequencer_rd fifo_rd_seqr;

endclass
