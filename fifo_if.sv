interface fifo_if (input bit clk,input bit rst);

logic wr_cs;
logic rd_cs;
logic wr_en;
logic rd_en;
logic [`DATA_WIDTH-1:0]data_in;
logic [`DATA_WIDTH-1:0]data_out;
logic full;
logic empty;

clocking drv_wr_cb @(posedge clk);
 default input #1 output#0;
 output wr_cs;
 output wr_en;
 output data_in;
 endclocking


clocking drv_rd_cb @(posedge clk);
 default input #1 output#0;
 output rd_cs;
 output rd_en;
 endclocking

clocking mon_wr_cb @(posedge clk);
 default input #1 output#0;
 input wr_cs;
 input wr_en;
 input data_in;
 input full;
 endclocking

clocking mon_rd_cb @(posedge clk);
 default input #1 output#0;
 input rd_cs;
 input rd_en;
 input empty;
 input data_out;
 endclocking

modport DRV_WR (clocking drv_wr_cb);
modport DRV_RD (clocking drv_rd_cb);
modport MON_WR (clocking mon_wr_cb);
modport MON_RD (clocking mon_rd_cb);
endinterface


