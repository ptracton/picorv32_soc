//                              -*- Mode: Verilog -*-
// Filename        : edge_detection.v
// Description     : Edge Detection
// Author          : Philip Tracton
// Created On      : Thu Dec 22 14:27:55 2016
// Last Modified By: Philip Tracton
// Last Modified On: Thu Dec 22 14:27:55 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

`include "timescale.v"

module edge_detection (/*AUTOARG*/
   // Outputs
   rising, failling,
   // Inputs
   clk_i, rst_i, signal
   ) ;
   input wire clk_i;
   input wire rst_i;
   input wire signal;
   output wire rising;
   output wire failling;
   
   reg         hold;
   
   assign rising  = ((hold == 1) & (signal == 0));
   assign falling = ((hold == 0) & (signal == 1));

   //
   // Delay and hold input signal by 1 clock to detect
   // changes in its value
   //

   always @(posedge clk_i)
     if (rst_i) begin
        hold <= 0;        
     end else begin
        hold <= signal;        
     end
   
endmodule // edge_detection

