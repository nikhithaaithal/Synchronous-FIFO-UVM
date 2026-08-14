class fifo_driver_rd extends uvm_driver #(trans);
 `uvm_component_utils(fifo_driver_rd)
  virtual fifo_if vif;
  fifo_cfg cfg;
 function new(string name="fifo_driver_rd",uvm_component parent);
   super.new(name,parent);
 endfunction
 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db #(fifo_cfg)::get(this, "","fifo_cfg",cfg))
   `uvm_fatal(get_type_name()," Read Driver getting failed");
 endfunction
 function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   vif=cfg.vif;
 endfunction
task run_phase (uvm_phase phase);
 begin
   
  forever begin
    seq_item_port.get_next_item(req);
    @(vif.drv_rd_cb);
    vif.drv_rd_cb.rd_cs  <= req.rd_cs;
    vif.drv_rd_cb.rd_en  <= req.rd_en;
    vif.drv_rd_cb.wr_cs  <= req.wr_cs;
    vif.drv_rd_cb.wr_en  <= req.wr_en;
  
`uvm_info("READ DRIVER",
          $sformatf("rd_cs=%0d, rd_en=%0d",
                     req.rd_cs,
                     req.rd_en
                    ),
          UVM_LOW)

 // vif.drv_rd_cb.rd_cs  <=0;
  //vif.drv_rd_cb.rd_en  <=0;
    
    seq_item_port.item_done();
  end
 end
endtask



endclass
