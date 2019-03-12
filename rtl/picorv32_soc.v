//                              -*- Mode: Verilog -*-
// Filename        : picorv32-soc.v
// Description     : picorv32 SOC 
// Author          : Philip Tracton
// Created On      : Mon Feb 18 19:51:51 2019
// Last Modified By: Philip Tracton
// Last Modified On: Mon Feb 18 19:51:51 2019
// Update Count    : 0
// Status          : Unknown, Use with caution!

module picorv32_soc(/*AUTOARG*/
		            // Outputs
		            uart_tx,
		            // Inputs
		            clk_sys_i, reset_sys_i, uart_rx
		            ) ;

   //
   // System Interface
   //
   input clk_sys_i;
   input reset_sys_i;

   //
   // UART Interface
   //
   input uart_rx;
   output wire uart_tx;
   assign uart_tx = 0;
   
   /*AUTOWIRE*/

   /*AUTOREG*/

   //
   // Bus Matrix
   //
   wire        clk_i;
   wire        rst_i;
   
   wire        wb_clk_i = clk_i;
   wire        wb_rst_i = rst_i;
   assign wb_clk = wb_clk_i;
   assign wb_rst = wb_rst_i;
   
`include "soc_bus_matrix.vh"

   wire        VDD = 1;
   wire        VSS = 0;

   assign wb_s2m_ram_rty = 0;
   assign wb_s2m_rom_rty = 0;
   assign wb_s2m_debug_rty =0;
   assign wb_s2m_uart_rty = 0;
   assign wb_s2m_uart_err =0;
   assign wb_s2m_debug_dat = 0;
   assign wb_s2m_debug_err = 0;
   assign wb_s2m_debug_ack = 0;
   
   
   //
   // Wishbone CPU
   //

   wire [31:0] interrupts;
   wire        uart_interrupt;
   
   assign interrupts [0]  = 0;
   assign interrupts [1]  = 0;
   assign interrupts [2]  = uart_interrupt;
   assign interrupts [3]  = 0;
   assign interrupts [4]  = 0;
   assign interrupts [5]  = 0;
   assign interrupts [6]  = 0;
   assign interrupts [7]  = 0;
   assign interrupts [8]  = 0;
   assign interrupts [9]  = 0;
   assign interrupts [10] = 0;
   assign interrupts [11] = 0;
   assign interrupts [12] = 0;
   assign interrupts [13] = 0;
   assign interrupts [14] = 0;
   assign interrupts [15] = 0;
   assign interrupts [16] = 0;
   assign interrupts [17] = 0;
   assign interrupts [18] = 0;
   assign interrupts [19] = 0;
   assign interrupts [20] = 0;
   assign interrupts [21] = 0;
   assign interrupts [22] = 0;
   assign interrupts [23] = 0;
   assign interrupts [24] = 0;
   assign interrupts [25] = 0;
   assign interrupts [26] = 0;
   assign interrupts [27] = 0;
   assign interrupts [28] = 0;
   assign interrupts [29] = 0;
   assign interrupts [30] = 0;
   assign interrupts [31] = 0;
   
   initial begin
      $display("INSTANTIATE PICORV32 CPU");      
   end   


   wire [31:0] 			 end_of_interrupt;
   wire                  mem_instr;


   // `define DEBUGASM 1
   // `define DEBUG 1
`define DEBUGREGS 1
   
   picorv32_wb #(.STACKADDR(32'h20002000),
		         .COMPRESSED_ISA(1)
		         )
   cpu(
       .trap(),

       // Wishbone interfaces
       .wb_rst_i(rst_i),
       .wb_clk_i(clk_i),

       .wbm_adr_o(wb_m2s_rv_adr),
       .wbm_dat_o(wb_m2s_rv_dat),
       .wbm_dat_i(wb_s2m_rv_dat),
       .wbm_we_o (wb_m2s_rv_we),
       .wbm_sel_o(wb_m2s_rv_sel),
       .wbm_stb_o(wb_m2s_rv_stb),
       .wbm_ack_i(wb_s2m_rv_ack),
       .wbm_cyc_o(wb_m2s_rv_cyc),

       // Pico Co-Processor Interface (PCPI)
       .pcpi_valid(),
       .pcpi_insn(),
       .pcpi_rs1(),
       .pcpi_rs2(),
       .pcpi_wr(1'b0),
       .pcpi_rd(32'b0),
       .pcpi_wait(1'b0),
       .pcpi_ready(1'b0),

       // IRQ interface
       .irq(interrupts),
       .eoi(end_of_interrupt),
       
       
       // Trace Interface
       .trace_valid(),
       .trace_data(),
       
       .mem_instr(mem_instr)
       );

   //
   // Unused CPU Signals
   //
   assign  wb_m2s_rv_cti = 3'b000;
   assign wb_m2s_daq_master_cti  = 3'b000;
   assign wb_m2s_dsp_master_cti = 3'b000;
   
   
   //
   // Data Aquiition Master (daq)
   //
   assign wb_m2s_daq_master_adr = 0;
   assign wb_m2s_daq_master_dat = 0;
   assign wb_m2s_daq_master_sel = 0 ;
   assign wb_m2s_daq_master_we = 0;
   assign wb_m2s_daq_master_cyc = 0;
   assign wb_m2s_daq_master_stb = 0;

   //
   // Data Aquisition Slave (daq_slave)
   //				  
   assign wb_s2m_daq_slave_dat = 0;
   assign wb_s2m_daq_slave_ack = 0;
   assign wb_s2m_daq_slave_err = 0;
   assign wb_s2m_daq_slave_rty = 0;

   
   //
   // Digital Signal Processing Master (dsp)
   //
   assign wb_m2s_dsp_master_adr = 0;
   assign wb_m2s_dsp_master_dat = 0;
   assign wb_m2s_dsp_master_sel = 0 ;
   assign wb_m2s_dsp_master_we = 0;
   assign wb_m2s_dsp_master_cyc = 0;
   assign wb_m2s_dsp_master_stb = 0;

   //
   // Data Aquisition Slave (daq_slave)
   //				  
   assign wb_s2m_dsp_slave_dat = 0;
   assign wb_s2m_dsp_slave_ack = 0;
   assign wb_s2m_dsp_slave_err = 0;
   assign wb_s2m_dsp_slave_rty = 0;
   
   
   //
   // Clock and reset controller
   //
   system_controller sys_con(
                             // Outputs
                             .clk_i(clk_i), 
                             .rst_i(rst_i), 
                             .nrst_i(nrst_i),
                             // Inputs
                             .clk_sys_i(clk_sys_i), 
                             .rst_sys_i(reset_sys_i)                             
                             );

   //
   // System SRAM
   //
   
   wb_ram #(.depth(32768))
   ram0(
        .wb_clk_i(clk_i),
        .wb_rst_i(rst_i),
      
        .wb_adr_i(wb_m2s_ram_adr[14:0]),
        .wb_dat_i(wb_m2s_ram_dat),
        .wb_sel_i(wb_m2s_ram_sel),
        .wb_we_i(wb_m2s_ram_we),
        .wb_bte_i(wb_m2s_ram_bte),
        .wb_cti_i(wb_m2s_ram_cti),
        .wb_cyc_i(wb_m2s_ram_cyc),
        .wb_stb_i(wb_m2s_ram_stb),
      
        .wb_ack_o(wb_s2m_ram_ack),
        .wb_err_o(wb_s2m_ram_err),
        .wb_dat_o(wb_s2m_ram_dat)
        );

   //
   // System ROM
   // 
   wb_rom #(.depth(32768))
   rom0(
        .wb_clk_i(clk_i),
        .wb_rst_i(rst_i),
      
        .wb_adr_i(wb_m2s_rom_adr[14:0]),
        .wb_dat_i(wb_m2s_rom_dat),
        .wb_sel_i(wb_m2s_rom_sel),
	    //        .wb_we_i(VSS),
        .wb_bte_i(wb_m2s_rom_bte),
        .wb_cti_i(wb_m2s_rom_cti),
        .wb_cyc_i(wb_m2s_rom_cyc),
        .wb_stb_i(wb_m2s_rom_stb),
      
        .wb_ack_o(wb_s2m_rom_ack),
        .wb_err_o(wb_s2m_rom_err),
        .wb_dat_o(wb_s2m_rom_dat)        
        );

   //
   // UART
   //
   //   assign wb_s2m_uart_dat = 0;
   //   assign wb_s2m_uart_ack = 0;

   uart_top	uart(
	             .wb_clk_i(clk_i),

	             // Wishbone signals
	             .wb_rst_i(rst_i),
                 .wb_adr_i(wb_m2s_uart_adr),
                 .wb_dat_i(wb_m2s_uart_dat),
                 .wb_dat_o(wb_s2m_uart_dat),
                 .wb_we_i(wb_m2s_uart_we),
                 .wb_stb_i(wb_m2s_uart_stb),
                 .wb_cyc_i(wb_m2s_uart_cyc),
                 .wb_ack_o(wb_s2m_uart_ack),
                 .wb_sel_i(wb_m2s_uart_sel),
	             .int_o(uart_interrupt), // interrupt request

	             // UART	signals
	             // serial input/output
	             .stx_pad_o(uart_tx),
                 .srx_pad_i(uart_rx),

	             // modem signals
	             .rts_pad_o(),
                 .cts_pad_i(1'b0),
                 .dtr_pad_o(),
                 .dsr_pad_i(1'b0),
                 .ri_pad_i(1'b0),
                 .dcd_pad_i(1'b0)
`ifdef UART_HAS_BAUDRATE_OUTPUT
	             , baud_o()
`endif
	             );


   
   //
   // Timer
   //
   assign wb_s2m_timer_dat = 0;
   assign wb_s2m_timer_ack = 0;
   assign wb_s2m_timer_err = 0;
   assign wb_s2m_timer_rty = 0;
   
   //
   // GPIO
   //
   assign wb_s2m_gpio_dat = 0;
   assign wb_s2m_gpio_ack = 0;
   assign wb_s2m_gpio_err = 0;
   assign wb_s2m_gpio_rty = 0;
   
`ifdef SIMULATION
   wire [31:0]           trigger_reg;
   fw_interface fw_if(
                      // Outputs
                      .wb_ack_o(wb_s2m_fw_interface_ack),
                      .wb_rty_o(wb_s2m_fw_interface_rty),
                      .wb_err_o(wb_s2m_fw_interface_err), 
                      .wb_dat_o(wb_s2m_fw_interface_dat),
                      .trigger_reg(trigger_reg),
                      // Inputs
                      .wb_clk_i(wb_clk_i), 
                      .wb_rst_i(wb_rst_i), 
                      .wb_adr_i(wb_m2s_fw_interface_adr), 
                      .wb_dat_i(wb_m2s_fw_interface_dat), 
                      .wb_sel_i(wb_m2s_fw_interface_sel), 
                      .wb_we_i(wb_m2s_fw_interface_we),
                      .wb_bte_i(wb_m2s_fw_interface_bte), 
                      .wb_cti_i(wb_m2s_fw_interface_cti), 
                      .wb_cyc_i(wb_m2s_fw_interface_cyc), 
                      .wb_stb_i(wb_m2s_fw_interface_stb), 
                      .interrupts(interrupts)
                      ) ;


`else // !`ifdef SIMULATION
   assign wb_s2m_fw_interface_ack = 0;
   assign wb_s2m_fw_interface_err = 0;
   assign wb_s2m_fw_interface_dat = 0;   
`endif
   
   
endmodule // soc_template
