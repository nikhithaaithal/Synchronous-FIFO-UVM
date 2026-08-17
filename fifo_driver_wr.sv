class fifo_driver_wr extends uvm_driver #(trans);
 `uvm_component_utils(fifo_driver_wr)
  virtual fifo_if vif;
  fifo_cfg cfg;
 function new(string name="fifo_driver_wr",uvm_component parent);
   super.new(name,parent);
 endfunction
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db #(fifo_cfg)::get(this, "","fifo_cfg",cfg))
   `uvm_fatal(get_type_name(),"Driver getting failed");
  endfunction
 function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   vif=cfg.vif;
 endfunction
 task run_phase (uvm_phase phase);
    vif.drv_wr_cb.wr_cs  <=0;
     vif.drv_wr_cb.wr_en  <=0;
     vif.drv_wr_cb.data_in <= 0;
   forever begin
    seq_item_port.get_next_item(req);
     @(vif.drv_wr_cb);
    vif.drv_wr_cb.wr_cs  <= req.wr_cs;
    vif.drv_wr_cb.wr_en  <= req.wr_en;
    vif.drv_wr_cb.data_in<= req.data_in;
    vif.drv_wr_cb.rd_cs  <= req.rd_cs;
    vif.drv_wr_cb.rd_en  <= req.rd_en;

`uvm_info("DRIVER",$sformatf("wr_cs=%0d, wr_en=%0d, data_in=%0d",
                     req.wr_cs,
                     req.wr_en,
      		    req.data_in
                    ),UVM_LOW)

    seq_item_port.item_done();
   end

endtask


endclass
