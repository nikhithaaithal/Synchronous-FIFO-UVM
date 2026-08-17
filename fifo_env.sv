class fifo_env extends uvm_env;
 `uvm_component_utils(fifo_env)
 fifo_active_agent_wr agt_wr;
 fifo_active_agent_rd agt_rd;
 fifo_vsequencer vseqr;
 fifo_scoreboard scb;
 fifo_subscriber sub;

function new(string name="fifo_env", uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 super.build_phase(phase);
  agt_wr=fifo_active_agent_wr::type_id::create("fifo_active_agent_wr",this);
  agt_rd=fifo_active_agent_rd::type_id::create("fifo_active_agent_rd",this);
  vseqr=fifo_vsequencer::type_id::create("fifo_vsequencer",this);
  scb= fifo_scoreboard ::type_id::create("fifo_scoreboard",this);
  sub=fifo_subscriber::type_id::create("fifo_subscriber",this);
 endfunction

function void connect_phase (uvm_phase phase);
 super.connect_phase(phase);
 agt_wr.mon_wr.wr_monitor_port.connect(scb.wr_mon);
 agt_rd.mon_rd.rd_monitor_port.connect(scb.rd_mon);
 vseqr.fifo_wr_seqr=agt_wr.seqr_wr;
 vseqr.fifo_rd_seqr=agt_rd.seqr_rd;
 agt_wr.mon_wr.wr_monitor_port.connect(sub.analysis_export);
 agt_rd.mon_rd.rd_monitor_port.connect(sub.analysis_export);
endfunction
endclass
  
