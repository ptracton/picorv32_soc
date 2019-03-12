//                              -*- Mode: Verilog -*-
// Filename        : fw_interface.v
// Description     : Firmware Testing Interface
// Author          : Philip Tracton
// Created On      : Wed Dec 21 14:03:49 2016
// Last Modified By: Philip Tracton
// Last Modified On: Wed Dec 21 14:03:49 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

module fw_interface (/*AUTOARG*/
   // Outputs
   wb_ack_o, wb_err_o, wb_rty_o, wb_dat_o, trigger_reg,
   // Inputs
   wb_clk_i, wb_rst_i, wb_adr_i, wb_dat_i, wb_sel_i, wb_we_i,
   wb_bte_i, wb_cti_i, wb_cyc_i, wb_stb_i, interrupts
   ) ;

   //
   // Wishbone Interface
   //
   input wire	   wb_clk_i;
   input wire      wb_rst_i;
   
   input wire [31:0] wb_adr_i;
   input wire [31:0] wb_dat_i;
   input wire [3:0]  wb_sel_i;
   input wire        wb_we_i;
   input wire [1:0]  wb_bte_i;
   input wire [2:0]  wb_cti_i;
   input wire        wb_cyc_i;
   input wire        wb_stb_i;
   
   output wire    wb_ack_o;
   output wire    wb_err_o;
   output wire    wb_rty_o;   
   output wire [31:0] wb_dat_o;
   output wire [31:0] trigger_reg;
   
   //
   // System Interface
   //
   input wire [31:0]  interrupts;
   

   /*AUTOREG*/

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [7:0]           data;                   // From wb of fw_interface_wb.v
   wire [31:0]          error_reg;              // From wb of fw_interface_wb.v
   wire [31:0]          expected_reg;           // From wb of fw_interface_wb.v
   wire [5:0]           index;                  // From wb of fw_interface_wb.v
   wire [31:0]          measured_reg;           // From wb of fw_interface_wb.v
   wire                 new_compare;            // From wb of fw_interface_wb.v
   wire                 new_error;              // From wb of fw_interface_wb.v
   wire                 new_report;             // From wb of fw_interface_wb.v
   wire                 new_warning;            // From wb of fw_interface_wb.v
   wire [31:0]          report_reg;             // From wb of fw_interface_wb.v
   wire [31:0]          warning_reg;            // From wb of fw_interface_wb.v
   wire                 write_mem;              // From wb of fw_interface_wb.v
   // End of automatics

   fw_interface_wb wb(/*AUTOINST*/
                      // Outputs
                      .wb_ack_o         (wb_ack_o),
                      .wb_rty_o         (wb_rty_o),
                      .wb_err_o         (wb_err_o),
                      .wb_dat_o         (wb_dat_o[31:0]),
                      .new_report       (new_report),
                      .new_warning      (new_warning),
                      .new_error        (new_error),
                      .new_compare      (new_compare),
                      .report_reg       (report_reg[31:0]),
                      .warning_reg      (warning_reg[31:0]),
                      .error_reg        (error_reg[31:0]),
                      .expected_reg     (expected_reg[31:0]),
                      .measured_reg     (measured_reg[31:0]),
                      .trigger_reg      (trigger_reg[31:0]),
                      .write_mem        (write_mem),
                      .data             (data[7:0]),
                      .index            (index[5:0]),
                      // Inputs
                      .wb_clk_i         (wb_clk_i),
                      .wb_rst_i         (wb_rst_i),
                      .wb_adr_i         (wb_adr_i[31:0]),
                      .wb_dat_i         (wb_dat_i[31:0]),
                      .wb_sel_i         (wb_sel_i[3:0]),
                      .wb_we_i          (wb_we_i),
                      .wb_bte_i         (wb_bte_i[1:0]),
                      .wb_cti_i         (wb_cti_i[2:0]),
                      .wb_cyc_i         (wb_cyc_i),
                      .wb_stb_i         (wb_stb_i));
   

   fw_interface_logic logic_inst(/*AUTOINST*/
                                 // Inputs
                                 .wb_clk_i              (wb_clk_i),
                                 .wb_rst_i              (wb_rst_i),
                                 .new_report            (new_report),
                                 .new_warning           (new_warning),
                                 .new_error             (new_error),
                                 .new_compare           (new_compare),
                                 .report_reg            (report_reg[31:0]),
                                 .warning_reg           (warning_reg[31:0]),
                                 .error_reg             (error_reg[31:0]),
                                 .expected_reg          (expected_reg[31:0]),
                                 .measured_reg          (measured_reg[31:0]),
                                 .index                 (index[5:0]),
                                 .data                  (data[7:0]),
                                 .write_mem             (write_mem));
   
   
endmodule // fw_interface
