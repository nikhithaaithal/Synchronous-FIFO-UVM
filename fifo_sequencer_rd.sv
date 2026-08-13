class fifo_sequencer_rd extends uvm_sequencer #(trans);
 `uvm_component_utils(fifo_sequencer_rd)
  function new(string name="fifo_sequencer_rd",uvm_component parent);
    super.new(name,parent);
  endfunction
 endclass
