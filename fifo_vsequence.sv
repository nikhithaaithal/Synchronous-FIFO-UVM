class fifo_vsequence extends uvm_sequence;
 `uvm_object_utils(fifo_vsequence)
  `uvm_declare_p_sequencer(fifo_vsequencer)
 function new(string name="fifo_vsequence");
  super.new(name);
 endfunction

 task body();
    fifo_seq_wr wr_seq;
    fifo_seq_rd rd_seq;
    fifo_write_read wr_rd_seq;
    fifo_read_write rd_wr_seq;
    fifo_seq_wr_cs_zero wr_cs_zero;
    fifo_seq_wr_en_zero wr_en_zero;
    fifo_seq_rd_cs_zero rd_cs_zero;
    fifo_seq_rd_en_zero rd_en_zero;
    fifo_seq_min_max min_max;

    fifo_sim_wr sim_wr;
    fifo_sim_rd sim_rd;

    wr_seq=fifo_seq_wr::type_id::create("wr_seq");
    rd_seq=fifo_seq_rd::type_id::create("rd_seq");
    wr_rd_seq = fifo_write_read::type_id::create("wr_rd_seq");
    rd_wr_seq = fifo_read_write::type_id::create("rd_wr_seq");
    sim_wr = fifo_sim_wr::type_id::create("sim_wr");
    sim_rd = fifo_sim_rd::type_id::create("sim_rd");

    wr_cs_zero = fifo_seq_wr_cs_zero::type_id::create("wr_cs_zero");
    wr_en_zero = fifo_seq_wr_en_zero::type_id::create("wr_en_zero");
    rd_cs_zero = fifo_seq_rd_cs_zero::type_id::create("rd_cs_zero");
    rd_en_zero = fifo_seq_rd_en_zero::type_id::create("rd_en_zero");
    min_max = fifo_seq_min_max::type_id::create("min_max");
    
    wr_seq.start(p_sequencer.fifo_wr_seqr);
    rd_seq.start(p_sequencer.fifo_rd_seqr);
   
    
    //write_read_write
    wr_rd_seq.start(p_sequencer.fifo_wr_seqr);
    rd_wr_seq.start(p_sequencer.fifo_rd_seqr);
    wr_rd_seq.start(p_sequencer.fifo_wr_seqr);
   
   
   
   sim_wr.start(p_sequencer.fifo_wr_seqr);
   sim_rd.start(p_sequencer.fifo_rd_seqr);


   wr_cs_zero.start(p_sequencer.fifo_wr_seqr);
   wr_en_zero.start(p_sequencer.fifo_wr_seqr);
   rd_cs_zero.start(p_sequencer.fifo_rd_seqr);
   rd_en_zero.start(p_sequencer.fifo_rd_seqr);


   min_max.start(p_sequencer.fifo_wr_seqr);
   rd_seq.start(p_sequencer.fifo_rd_seqr);


   
   
  fork 
    wr_seq.start(p_sequencer.fifo_wr_seqr);
    rd_seq.start(p_sequencer.fifo_rd_seqr);
  join


endtask
endclass
