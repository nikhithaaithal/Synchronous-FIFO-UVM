class fifo_sequencer_wr extends uvm_sequencer #(trans);
 `uvm_component_utils(fifo_sequencer_wr)
  function new(string name="fifo_sequencer_wr",uvm_component parent);
    super.new(name,parent);
  endfunction
 endclass
