class fifo_test extends uvm_test;
 `uvm_component_utils(fifo_test)
 fifo_env env;
 virtual fifo_if vif;
 fifo_cfg cfg;
 fifo_vsequence vseq;

 function new(string name="fifo_test",uvm_component parent);
  super.new(name,parent);
 endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
cfg = fifo_cfg::type_id::create("cfg");
 if(!uvm_config_db #(virtual fifo_if)::get(this,"","fifo_if",cfg.vif))
  `uvm_fatal(get_type_name(),"Test failed");
 cfg.is_active=UVM_ACTIVE;
 uvm_config_db #(fifo_cfg)::set(this,"*","fifo_cfg",cfg);
 env=fifo_env::type_id::create("env",this);

`uvm_info(get_type_name(),"env created",UVM_MEDIUM);
 endfunction

function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
 phase.raise_objection(this);
   vseq=fifo_vsequence::type_id::create("vseq");
   vseq.start(env.vseqr);
   #25;
 phase.drop_objection(this);

endtask


endclass

