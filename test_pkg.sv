
package test_pkg;

	 import uvm_pkg::*;
	`include "uvm_macros.svh"
	`include "fifo_seq_item.sv"
	`include "fifo_cfg.sv"
	`include "fifo_driver_wr.sv"
	`include "fifo_driver_rd.sv"
	`include "fifo_monitor_wr.sv"
	`include "fifo_monitor_rd.sv"
	`include "fifo_sequencer_wr.sv"
	`include "fifo_sequencer_rd.sv"
	`include "fifo_vsequencer.sv"
	`include "fifo_active_agent_rd.sv"
	`include "fifo_active_agent_wr.sv"
	`include "fifo_scoreboard.sv"
        //`include "fifo_subscriber.sv"
	`include "fifo_env.sv"
	`include "fifo_sequence.sv"
	`include "fifo_vsequence.sv"
	`include "fifo_test.sv"

endpackage
