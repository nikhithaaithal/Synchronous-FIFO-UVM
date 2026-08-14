class fifo_monitor_rd extends uvm_monitor;
`uvm_component_utils(fifo_monitor_rd);
virtual fifo_if.MON_RD vif;
fifo_cfg cfg;
uvm_analysis_port #(trans) rd_monitor_port;
trans duv2monr;

function new(string name="fifo_monitor_rd",uvm_component parent);
 super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db #(fifo_cfg)::get(this,"","fifo_cfg",cfg))
 `uvm_fatal(get_type_name(),"Read monitor getting failed");
  rd_monitor_port = new("rd_monitor_port",this);
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
 @(vif.mon_rd_cb);
  
if(vif.mon_rd_cb.rd_cs && vif.mon_rd_cb.rd_en) begin
 // @(vif.mon_rd_cb);
duv2monr=trans::type_id::create("duv2monr");
duv2monr.rd_cs    = vif.mon_rd_cb.rd_cs;
duv2monr.rd_en    = vif.mon_rd_cb.rd_en;
duv2monr.empty    = vif.mon_rd_cb.empty;
 //@(vif.mon_rd_cb);
duv2monr.data_out = vif.mon_rd_cb.data_out;
rd_monitor_port.write(duv2monr);
`uvm_info("READ_MONITOR",
          $sformatf("rd_cs=%0d, rd_en=%0d, data_out=%0d, empty=%0d",
                    duv2monr.rd_cs,
                    duv2monr.rd_en,
                    vif.mon_rd_cb.data_out,
                    duv2monr.empty),
          UVM_LOW)
end
end

endtask
endclass
