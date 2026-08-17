class fifo_monitor_wr extends uvm_monitor;
`uvm_component_utils(fifo_monitor_wr);
virtual fifo_if.MON_WR vif;
fifo_cfg cfg;
uvm_analysis_port #(trans) wr_monitor_port;
trans duv2mon;

function new(string name="fifo_monitor_wr",uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(fifo_cfg)::get(this,"","fifo_cfg",cfg))
 `uvm_fatal(get_type_name(),"Write monitor getting failed");
 wr_monitor_port = new("wr_monitor_port",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   vif=cfg.vif;
 endfunction

task run_phase(uvm_phase phase);

forever begin
collect_data();
end
endtask

task collect_data();
begin
@(vif.mon_wr_cb);

//if(vif.mon_wr_cb.wr_cs && vif.mon_wr_cb.wr_en) begin
duv2mon=trans::type_id::create("duv2mon");
duv2mon.wr_cs    = vif.mon_wr_cb.wr_cs;
duv2mon.wr_en    = vif.mon_wr_cb.wr_en;
duv2mon.data_in  = vif.mon_wr_cb.data_in;
duv2mon.full     = vif.mon_wr_cb.full;
wr_monitor_port.write(duv2mon);
`uvm_info("WRITE_MONITOR",
          $sformatf("wr_cs=%0d, wr_en=%0d, data_in=%0d, full=%0d",
                    duv2mon.wr_cs,
                    duv2mon.wr_en,
                    duv2mon.data_in,
                    duv2mon.full),
          UVM_LOW)
//end
end

endtask
endclass
