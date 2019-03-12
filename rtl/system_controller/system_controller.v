//                              -*- Mode: Verilog -*-
// Filename        : system_controller.v
// Description     : Prototype System Controller for SPI FPGA
// Author          : Philip Tracton
// Created On      : Fri Jul  8 20:54:44 2016
// Last Modified By: Philip Tracton
// Last Modified On: Fri Jul  8 20:54:44 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

module system_controller (/*AUTOARG*/
   // Outputs
   clk_i, rst_i, nrst_i,
   // Inputs
   clk_sys_i, rst_sys_i
   ) ;
   input wire clk_sys_i;
   input wire rst_sys_i;

   output wire clk_i;
   output wire rst_i;
   output wire nrst_i;
   

`ifdef RTL
   initial begin
      $display("RTL SYSCON!");
      //$finish;      
   end
   
   assign clk_i = clk_sys_i;
   
   reg [4:0] reset_count =0;
   assign rst_i = |reset_count; 
   assign nrst_i = ~rst_i;
   
   always @(posedge clk_sys_i or posedge rst_sys_i)
     if (rst_sys_i) begin
        reset_count <= 1;        
     end else begin
        if (reset_count)
          reset_count <= reset_count + 1;
     end
`else
 `ifdef XILINX

   initial begin
      $display("XILINX SYSCON!");
      //$finish;      
   end

   system_controller_xilinx sys_con_xil(/*AUTOINST*/
                                        // Outputs
                                        .clk_i          (clk_i),
                                        .rst_i          (rst_i),
                                        .nrst_i         (nrst_i),
                                        // Inputs
                                        .clk_sys_i      (clk_sys_i),
                                        .rst_sys_i      (rst_sys_i));
   
 `endif //  `ifdef XILINX
   
 `ifdef ALTERA
   initial begin
      $display("ALTERA SYSCON");
   end
      system_controller_altera sys_con_alt(/*AUTOINST*/
                                           // Outputs
                                           .clk_i               (clk_i),
                                           .rst_i               (rst_i),
                                           .nrst_i              (nrst_i),
                                           // Inputs
                                           .clk_sys_i           (clk_sys_i),
                                           .rst_sys_i           (rst_sys_i));
      
      
 `endif

   initial begin
      $error("SYSCON WON'T WORK");      
   end
   
`endif //  `ifdef RTL 

   
   
endmodule // system_controller
