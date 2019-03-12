//                              -*- Mode: Verilog -*-
// Filename        : system_controller_xilinx.v
// Description     : Xilinx ARTIX 7 System Controller
// Author          : Philip Tracton
// Created On      : Mon Jan  2 16:03:54 2017
// Last Modified By: Philip Tracton
// Last Modified On: Mon Jan  2 16:03:54 2017
// Update Count    : 0
// Status          : Unknown, Use with caution!

module system_controller_xilinx (/*AUTOARG*/
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

   //
   // Input buffer to make sure the XCLK signal is routed
   // onto the low skew clock lines
   //
   wire        xclk_buf;
   IBUF clk_ibuf(.I(clk_sys_i), .O(xclk_buf));


   //   
   // Clock buffer that ensures the clock going out to the hardware is on a low skew line
   //
   wire        CLKFBOUT;   
   BUFGCE clk_bug (
                   .CE(1'b1),
                   .O(clk_i), // 1-bit output Clock buffer output
                   .I(CLKFBOUT) // 1-bit input Clock buffer input (S=0)
                   );

   //
   // MMCME2 Tile for clock control
   //
   MMCME2_BASE #(
                 .BANDWIDTH("OPTIMIZED"),
                 // Jitter programming (OPTIMIZED, HIGH, LOW)
                 .CLKFBOUT_MULT_F(6.0),
                 // Multiply value for all CLKOUT (2.000-64.000).
                 .CLKFBOUT_PHASE(0.0),
                 // Phase offset in degrees of CLKFB (-360.000-360.000).
                 .CLKIN1_PERIOD(10.0),
                 // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
                 // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
                 .CLKOUT1_DIVIDE(1),
                 .CLKOUT2_DIVIDE(1),
                 .CLKOUT3_DIVIDE(1),
                 .CLKOUT4_DIVIDE(1),
                 .CLKOUT5_DIVIDE(1),
                 .CLKOUT6_DIVIDE(1),
                 .CLKOUT0_DIVIDE_F(1.0),
                 // Divide amount for CLKOUT0 (1.000-128.000).
                 // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
                 .CLKOUT0_DUTY_CYCLE(0.5),
                 .CLKOUT1_DUTY_CYCLE(0.5),
                 .CLKOUT2_DUTY_CYCLE(0.5),
                 .CLKOUT3_DUTY_CYCLE(0.5),
                 .CLKOUT4_DUTY_CYCLE(0.5),
                 .CLKOUT5_DUTY_CYCLE(0.5),
                 .CLKOUT6_DUTY_CYCLE(0.5),
                 // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
                 .CLKOUT0_PHASE(0.0),
                 .CLKOUT1_PHASE(0.0),
                 .CLKOUT2_PHASE(0.0),
                 .CLKOUT3_PHASE(0.0),
                 .CLKOUT4_PHASE(0.0),
                 .CLKOUT5_PHASE(0.0),
                 .CLKOUT6_PHASE(0.0),
                 .CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
                 .DIVCLK_DIVIDE(1),
                 // Master division value (1-106)
                 .REF_JITTER1(0.0),
                 // Reference input jitter in UI (0.000-0.999).
                 .STARTUP_WAIT("FALSE")
                 // Delays DONE until MMCM is locked (FALSE, TRUE)
                 )
   MMCME2_BASE_inst (
                     // Clock Outputs: 1-bit (each) output: User configurable clock outputs
                     .CLKOUT0(),
                     // 1-bit output: CLKOUT0
                     .CLKOUT0B(),
                     // 1-bit output: Inverted CLKOUT0
                     .CLKOUT1(),
                     // 1-bit output: CLKOUT1
                     .CLKOUT1B(),
                     // 1-bit output: Inverted CLKOUT1
                     .CLKOUT2(),
                     // 1-bit output: CLKOUT2
                     .CLKOUT2B(),
                     // 1-bit output: Inverted CLKOUT2
                     .CLKOUT3(),
                     // 1-bit output: CLKOUT3
                     .CLKOUT3B(),
                     // 1-bit output: Inverted CLKOUT3
                     .CLKOUT4(),
                     // 1-bit output: CLKOUT4
                     .CLKOUT5(),
                     // 1-bit output: CLKOUT5
                     .CLKOUT6(),
                     // 1-bit output: CLKOUT6
                     // Feedback Clocks: 1-bit (each) output: Clock feedback ports
                     .CLKFBOUT(CLKFBOUT),
                     // 1-bit output: Feedback clock
                     .CLKFBOUTB(), // 1-bit output: Inverted CLKFBOUT
                     // Status Ports: 1-bit (each) output: MMCM status ports
                     .LOCKED(LOCKED),
                     // 1-bit output: LOCK
                     // Clock Inputs: 1-bit (each) input: Clock input
                     .CLKIN1(xclk_buf),
                     // 1-bit input: Clock
                     // Control Ports: 1-bit (each) input: MMCM control ports
                     .PWRDWN(1'b0),
                     // 1-bit input: Power-down
                     //                     .RST(dcm_reset),
                     .RST(rst_sys_i),
                     // 1-bit input: Reset
                     // Feedback Clocks: 1-bit (each) input: Clock feedback ports
                     .CLKFBIN(clk_i)
                     // 1-bit input: Feedback clock
                     );
   // End of MMCME2_BASE_inst instantiation
   
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
   always @(posedge xclk_buf)
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
   
   
endmodule // system_controller_xilinx
