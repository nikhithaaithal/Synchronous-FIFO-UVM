class fifo_subscriber extends uvm_subscriber #(trans);
  `uvm_component_utils(fifo_subscriber)
  trans tr;

covergroup fifo_cg;
 wr_cs_cg:coverpoint tr.wr_cs;
 rd_cs_cg:coverpoint tr.rd_cs;
 wr_en_cg:coverpoint tr.wr_en;
 rd_en_cg:coverpoint tr.rd_en;
 data_in_cg:coverpoint tr.data_iniff (tr.wr_cs && tr.wr_en) {
    bins low  = {[0:85]};
    bins mid  = {[86:170]};
    bins high = {[171:255]};  }
 cross wr_cs_cg, wr_en_cg;
 cross rd_cs_cg, rd_en_cg;
endgroup
function  new(string name,uvm_component parent);
super.new(name,parent);
fifo_cg=new();
endfunction
function void write(trans t);
     tr=t;
    //`uvm_info("SUBSCRIBER", $sformatf("Received transaction:\n%s", tr.sprint()), UVM_HIGH)
     fifo_cg.sample();
endfunction
endclass
