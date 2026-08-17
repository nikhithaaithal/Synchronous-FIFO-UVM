
class fifo_seq_wr extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_wr)
 function new(string name="fifo_seq_wr");
  super.new(name);
 endfunction
 task body();
   repeat(25)begin
    req=trans::type_id::create("req");
   start_item(req);
     assert(req.randomize() with {wr_cs ==1;wr_en==1;});
   finish_item(req);
   end
 endtask
endclass

class fifo_seq_rd extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_rd)
 function new(string name="fifo_seq_rd");
  super.new(name);
 endfunction
 task body();
   repeat(25)begin
   req=trans::type_id::create("req");
   start_item(req);
     assert(req.randomize() with {rd_cs ==1;rd_en==1;});
   finish_item(req);
  end
 endtask
endclass

class fifo_sim_wr extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_sim_wr)
 function new(string name="fifo_sim_wr");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
   repeat(256)begin
   start_item(req);
     assert(req.randomize() with {wr_cs ==1;wr_en==1;rd_cs ==0;rd_en==0;});
   finish_item(req);
   end
 endtask
endclass

class fifo_sim_rd extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_sim_rd)
 function new(string name="fifo_sim_rd");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
   repeat(256)begin
   start_item(req);
     assert(req.randomize() with {rd_cs ==1;rd_en==1;wr_cs ==0;wr_en==0;});
   finish_item(req);
  end
 endtask
endclass


class fifo_write_read extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_write_read)
 function new(string name="fifo_write_read");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
   
   start_item(req);
     assert(req.randomize() with {wr_cs ==1;wr_en==1;rd_cs ==0;rd_en==0;});
   finish_item(req);

 endtask
endclass

class fifo_read_write extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_read_write)
 function new(string name="fifo_read_write");
  super.new(name);
 endfunction
 task body();

 req=trans::type_id::create("req");
   start_item(req);
     assert(req.randomize() with {wr_cs ==0;wr_en==0;rd_cs ==1;rd_en==1;});
   finish_item(req);
   

 endtask
endclass


class fifo_seq_wr_cs_zero extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_wr_cs_zero)

  function new(string name="fifo_seq_wr_cs_zero");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

    repeat(5) begin
      start_item(req);

      assert(req.randomize() with {
        wr_cs == 0;
        wr_en == 1;
        rd_cs == 0;
        rd_en == 0;
      });

      finish_item(req);
    end
  endtask
endclass

class fifo_seq_wr_en_zero extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_wr_en_zero)

  function new(string name="fifo_seq_wr_en_zero");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

    repeat(5) begin
      start_item(req);

      assert(req.randomize() with {
        wr_cs == 1;
        wr_en == 0;
        rd_cs == 0;
        rd_en == 0;
      });

      finish_item(req);
    end
  endtask
endclass

class fifo_seq_rd_cs_zero extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_rd_cs_zero)

  function new(string name="fifo_seq_rd_cs_zero");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

    repeat(5) begin
      start_item(req);

      assert(req.randomize() with {
        rd_cs == 0;
        rd_en == 1;
        wr_cs == 0;
        wr_en == 0;
      });

      finish_item(req);
    end

  endtask
endclass


class fifo_seq_rd_en_zero extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_rd_en_zero)

  function new(string name="fifo_seq_rd_en_zero");
    super.new(name);
  endfunction

  task body();
    req = trans::type_id::create("req");

    repeat(5) begin
      start_item(req);

      assert(req.randomize() with {
        rd_cs == 1;
        rd_en == 0;
        wr_cs == 0;
        wr_en == 0;
      });

      finish_item(req);
    end

  endtask
endclass


class fifo_seq_min_max extends uvm_sequence#(trans);
  `uvm_object_utils(fifo_seq_min_max)

  function new(string name="fifo_seq_min_max");
    super.new(name);
  endfunction

  task body();

    req = trans::type_id::create("req");

    start_item(req);
    assert(req.randomize() with {
      wr_cs == 1;
      wr_en == 1;
      rd_cs == 0;
      rd_en == 0;
      data_in == '0;
    });
    finish_item(req);

    start_item(req);
    assert(req.randomize() with {
      wr_cs == 1;
      wr_en == 1;
      rd_cs == 0;
      rd_en == 0;
      data_in == '1;
    });
    finish_item(req);

  endtask
endclass
