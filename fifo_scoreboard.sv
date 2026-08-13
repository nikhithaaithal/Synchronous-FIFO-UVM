`uvm_analysis_imp_decl(_rd)
`uvm_analysis_imp_decl(_wr)
class fifo_scoreboard extends uvm_scoreboard;
 `uvm_component_utils(fifo_scoreboard)
  uvm_analysis_imp_wr#(trans,fifo_scoreboard)wr_mon;
  uvm_analysis_imp_rd#(trans,fifo_scoreboard)rd_mon;

logic[`DATA_WIDTH-1:0]queue[$];
logic[`DATA_WIDTH-1:0]read_data;
int pass;
int fail;
function new(string name="fifo_scoreboard", uvm_component parent);
 super.new(name,parent);
 wr_mon= new("wr_mon",this);
 rd_mon= new("rd_mon",this);
endfunction

 function void write_wr(trans wr);
//reset
   if(queue.size()!=`RAM_DEPTH && wr.wr_en ==1 && wr.wr_cs ==1)
    begin
    queue.push_back(wr.data_in);
    `uvm_info(get_type_name(),"writing data",UVM_MEDIUM)
    end
   if(queue.size()==`RAM_DEPTH )
    begin
     if( wr.full)
    `uvm_info(get_type_name(),"FIFO is full",UVM_MEDIUM)
     else
   `uvm_error(get_type_name(), "FIFO is full but full not asserted")
    end
 endfunction

function void write_rd(trans rd);

if(queue.size()!=0 && rd.rd_en ==1 && rd.rd_cs ==1)
begin
 read_data=queue.pop_front();
  if(read_data == rd.data_out)
    
    `uvm_info("SCOREBOARD",
          $sformatf("data_out = %d expected_data_out=%d",
                    rd.data_out, read_data),
          UVM_LOW)
   else begin
   `uvm_error(get_type_name(), "Mismatch in data_out ")
    `uvm_info("SCOREBOARD",
          $sformatf("data_out = %d expected_data_out=%d",
                    rd.data_out, read_data),
          UVM_LOW) end
end
if(queue.size()==0 )
   begin
    if( rd.empty)
    `uvm_info(get_type_name(),"FIFO IS EMPTY",UVM_MEDIUM)
   else
   `uvm_error(get_type_name(), "FIFO is empty but empty not asserted")
   end

 endfunction



endclass
