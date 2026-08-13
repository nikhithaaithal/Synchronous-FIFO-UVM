module fifo_asssertion(
     input bit clk,
     input logic rst,
     input logic rd_cs,
     input logic wr_cs,
     input logic rd_en,
     input logic wr_en,
     input logic full,
     input logic empty);
     
property p1;
@(posedge clk) disable iff r


