//                              -*- Mode: Verilog -*-
// Filename        : test_00.v
// Description     : Simple ADXL362 Test Case to bring environment to life
// Author          : Philip Tracton
// Created On      : Thu Jun 23 11:36:12 2016
// Last Modified By: Philip Tracton
// Last Modified On: Thu Jun 23 11:36:12 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

`include "timescale.v"
`include "simulation_includes.vh"

module test_case ();

   //
   // Test Configuration
   // These parameters need to be set for each test case
   //
   parameter simulation_name = "boot_rom";    
   parameter number_of_tests = 0;
`include "setup.v"

   reg  err;
   reg [31:0] data_out;
   integer    i;
   
   initial begin
      $display("Boot Case");
      @(posedge `WB_RST);
      @(negedge `WB_RST);
      @(posedge `WB_CLK);
      `UART_CONFIG;

//      #300;
//      `TEST_COMPLETE;

      `UART_READ_CHAR(8'h30);
      `UART_READ_CHAR(8'h31);
      `UART_READ_CHAR(8'h32);
      `UART_READ_CHAR(8'h33);

      repeat(100) @(posedge `WB_CLK);

      `UART_WRITE_CHAR("A");
      `UART_READ_CHAR("A");

      `UART_WRITE_CHAR("B");
      `UART_READ_CHAR("B");

      `UART_WRITE_CHAR("C");
      `UART_READ_CHAR("C");


      
      #500000;
      `TEST_COMPLETE;      
   end

endmodule // test_case
