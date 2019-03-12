//                              -*- Mode: Verilog -*-
// Filename        : fw_interface_logic.v
// Description     : FW Interface Test Logic
// Author          : Philip Tracton
// Created On      : Wed Dec 21 14:09:23 2016
// Last Modified By: Philip Tracton
// Last Modified On: Wed Dec 21 14:09:23 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

`include "timescale.v"

`ifdef SIMULATION
 `include "simulation_includes.vh"
`endif

module fw_interface_logic (/*AUTOARG*/
                           // Inputs
                           wb_clk_i, wb_rst_i, new_report, new_warning, new_error,
                           new_compare, report_reg, warning_reg, error_reg, expected_reg,
                           measured_reg, index, data, write_mem
                           ) ;

   input wire wb_clk_i;
   input wire wb_rst_i;


   input wire new_report;
   input wire new_warning;
   input wire new_error;
   input wire new_compare;

   input wire [31:0] report_reg;
   input wire [31:0] warning_reg;
   input wire [31:0] error_reg;
   input wire [31:0] expected_reg;
   input wire [31:0] measured_reg;   
   input wire [5:0]  index;
   input wire [7:0]  data;
   input wire        write_mem;
   
`ifdef SIMULATION   
   reg [7:0]         string_mem[31:0];
   
   always @(posedge wb_clk_i)
     if (write_mem) begin
        string_mem[index] <= data;
        string_mem[index+1] <= 0;
	    //$display("string_mem[%d] = %c @ %d", index, data, $realtime);
     end
   
   wire new_report_rising;   
   edge_detection new_report_edge(
                                  // Outputs
                                  .rising(new_report_rising), 
                                  .failling(),
                                  // Inputs
                                  .clk_i(wb_clk_i), 
                                  .rst_i(wb_rst_i), 
                                  .signal(new_report)
                                  );

   integer i;
   reg [(8*32)-1:0] test_string;   
   always @ (posedge new_report_rising) begin
      i = 0;        
      test_string = 0;
      while (string_mem[i] != 8'h0) begin
	     #1 test_string = {test_string[8*29:0], string_mem[i]};
         #1 string_mem[i] = 0;
         #1 i = i + 1;
      end
      //$display("%s @ %d", test_string, $time);
      `TEST_COMPARE(test_string,0,0);
   end // always @ (posedge new_report_rising)


   wire new_compare_rising;
   edge_detection new_compare_edge(
                                   // Outputs
                                   .rising(new_compare_rising),
                                   .failling(),
                                   // Inputs
                                   .clk_i(wb_clk_i),
                                   .rst_i(wb_rst_i),
                                   .signal(new_compare)
                                   );
   
   /* -----\/----- EXCLUDED -----\/-----
    always @ (posedge new_compare_rising) begin
    i = 0;
    test_string = 0;
    while (string_mem[i] != 8'h0) begin
    #1 test_string = {test_string[8*29:0], string_mem[i]};
    #1 string_mem[i] = 0;
    #1 i = i + 1;
      end
    `TEST_COMPARE(test_string,expected_reg,measured_reg);
   end // always @ (posedge new_report_rising)
    -----/\----- EXCLUDED -----/\----- */
   
`endif
   
endmodule // fw_interface_logic
