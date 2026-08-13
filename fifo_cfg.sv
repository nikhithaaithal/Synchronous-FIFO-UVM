class fifo_cfg extends uvm_object;
 `uvm_object_utils(fifo_cfg)
 virtual fifo_if vif;
 uvm_active_passive_enum is_active;
function new(string name ="fifo_cfg");
  super.new(name);
endfunction
endclass
