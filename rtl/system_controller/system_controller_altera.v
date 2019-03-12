//                              -*- Mode: Verilog -*-
// Filename        : system_controller_altera.v
// Description     : System Controller for Altera FPGA
// Author          : Philip Tracton
// Created On      : Sat Jan  7 21:51:18 2017
// Last Modified By: Philip Tracton
// Last Modified On: Sat Jan  7 21:51:18 2017
// Update Count    : 0
// Status          : Unknown, Use with caution!
module system_controller_altera (/*AUTOARG*/
   // Outputs
   clk_i, rst_i, nrst_i,
   // Inputs
   clk_sys_i, rst_sys_i
   ) ;
   input wire clk_sys_i;
   input wire rst_sys_i;
   
   output wire clk_i;
   output reg  rst_i;
   output wire nrst_i;
   wire        LOCKED;
   
   altera_syscon_pll pll(
                         .areset(rst_sys_i),
	                     .inclk0(clk_sys_i),
	                     .c0(clk_i),
	                     .locked(LOCKED)
                         );

   //
   // RESET Logic
   //
   reg [3:0]  rst_count;   

   //
   // Inverted reset signal since some 3rd party blocks use an active low reset
   //
   assign nrst_i = ~rst_i;

   //
   // If input rst_sys_i or we are NOT locked, keep rst_i high for rest of system
   // Once LOCKED is asserted, count down the rst_count number of clocks to make sure all
   // synchronous reset blocks get a few clocks and can reset correctly.  Once the count reaches 0
   // release reset and let the sytem run
   //
   always @(posedge clk_sys_i)
     if (rst_sys_i | ~LOCKED) begin
        rst_i <= 1;       
        rst_count <= 4'hF;        
     end else begin
        if (LOCKED) begin
           if (rst_count) begin
              rst_count <= rst_count - 1;              
           end else begin
              rst_i <= 0;              
           end           
        end        
     end // else: !if(rst_sys_i | ~LOCKED)
     
endmodule // system_controller_altera
