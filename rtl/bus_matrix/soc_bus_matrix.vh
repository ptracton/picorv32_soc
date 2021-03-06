// THIS FILE IS AUTOGENERATED BY wb_intercon_gen
// ANY MANUAL CHANGES WILL BE LOST
wire [31:0] wb_m2s_rv_adr;
wire [31:0] wb_m2s_rv_dat;
wire  [3:0] wb_m2s_rv_sel;
wire        wb_m2s_rv_we;
wire        wb_m2s_rv_cyc;
wire        wb_m2s_rv_stb;
wire  [2:0] wb_m2s_rv_cti;
wire  [1:0] wb_m2s_rv_bte;
wire [31:0] wb_s2m_rv_dat;
wire        wb_s2m_rv_ack;
wire        wb_s2m_rv_err;
wire        wb_s2m_rv_rty;
wire [31:0] wb_m2s_daq_master_adr;
wire [31:0] wb_m2s_daq_master_dat;
wire  [3:0] wb_m2s_daq_master_sel;
wire        wb_m2s_daq_master_we;
wire        wb_m2s_daq_master_cyc;
wire        wb_m2s_daq_master_stb;
wire  [2:0] wb_m2s_daq_master_cti;
wire  [1:0] wb_m2s_daq_master_bte;
wire [31:0] wb_s2m_daq_master_dat;
wire        wb_s2m_daq_master_ack;
wire        wb_s2m_daq_master_err;
wire        wb_s2m_daq_master_rty;
wire [31:0] wb_m2s_dsp_master_adr;
wire [31:0] wb_m2s_dsp_master_dat;
wire  [3:0] wb_m2s_dsp_master_sel;
wire        wb_m2s_dsp_master_we;
wire        wb_m2s_dsp_master_cyc;
wire        wb_m2s_dsp_master_stb;
wire  [2:0] wb_m2s_dsp_master_cti;
wire  [1:0] wb_m2s_dsp_master_bte;
wire [31:0] wb_s2m_dsp_master_dat;
wire        wb_s2m_dsp_master_ack;
wire        wb_s2m_dsp_master_err;
wire        wb_s2m_dsp_master_rty;
wire [31:0] wb_m2s_uart_adr;
wire [31:0] wb_m2s_uart_dat;
wire  [3:0] wb_m2s_uart_sel;
wire        wb_m2s_uart_we;
wire        wb_m2s_uart_cyc;
wire        wb_m2s_uart_stb;
wire  [2:0] wb_m2s_uart_cti;
wire  [1:0] wb_m2s_uart_bte;
wire [31:0] wb_s2m_uart_dat;
wire        wb_s2m_uart_ack;
wire        wb_s2m_uart_err;
wire        wb_s2m_uart_rty;
wire [31:0] wb_m2s_dsp_slave_adr;
wire [31:0] wb_m2s_dsp_slave_dat;
wire  [3:0] wb_m2s_dsp_slave_sel;
wire        wb_m2s_dsp_slave_we;
wire        wb_m2s_dsp_slave_cyc;
wire        wb_m2s_dsp_slave_stb;
wire  [2:0] wb_m2s_dsp_slave_cti;
wire  [1:0] wb_m2s_dsp_slave_bte;
wire [31:0] wb_s2m_dsp_slave_dat;
wire        wb_s2m_dsp_slave_ack;
wire        wb_s2m_dsp_slave_err;
wire        wb_s2m_dsp_slave_rty;
wire [31:0] wb_m2s_daq_slave_adr;
wire [31:0] wb_m2s_daq_slave_dat;
wire  [3:0] wb_m2s_daq_slave_sel;
wire        wb_m2s_daq_slave_we;
wire        wb_m2s_daq_slave_cyc;
wire        wb_m2s_daq_slave_stb;
wire  [2:0] wb_m2s_daq_slave_cti;
wire  [1:0] wb_m2s_daq_slave_bte;
wire [31:0] wb_s2m_daq_slave_dat;
wire        wb_s2m_daq_slave_ack;
wire        wb_s2m_daq_slave_err;
wire        wb_s2m_daq_slave_rty;
wire [31:0] wb_m2s_timer_adr;
wire [31:0] wb_m2s_timer_dat;
wire  [3:0] wb_m2s_timer_sel;
wire        wb_m2s_timer_we;
wire        wb_m2s_timer_cyc;
wire        wb_m2s_timer_stb;
wire  [2:0] wb_m2s_timer_cti;
wire  [1:0] wb_m2s_timer_bte;
wire [31:0] wb_s2m_timer_dat;
wire        wb_s2m_timer_ack;
wire        wb_s2m_timer_err;
wire        wb_s2m_timer_rty;
wire [31:0] wb_m2s_gpio_adr;
wire [31:0] wb_m2s_gpio_dat;
wire  [3:0] wb_m2s_gpio_sel;
wire        wb_m2s_gpio_we;
wire        wb_m2s_gpio_cyc;
wire        wb_m2s_gpio_stb;
wire  [2:0] wb_m2s_gpio_cti;
wire  [1:0] wb_m2s_gpio_bte;
wire [31:0] wb_s2m_gpio_dat;
wire        wb_s2m_gpio_ack;
wire        wb_s2m_gpio_err;
wire        wb_s2m_gpio_rty;
wire [31:0] wb_m2s_ram_adr;
wire [31:0] wb_m2s_ram_dat;
wire  [3:0] wb_m2s_ram_sel;
wire        wb_m2s_ram_we;
wire        wb_m2s_ram_cyc;
wire        wb_m2s_ram_stb;
wire  [2:0] wb_m2s_ram_cti;
wire  [1:0] wb_m2s_ram_bte;
wire [31:0] wb_s2m_ram_dat;
wire        wb_s2m_ram_ack;
wire        wb_s2m_ram_err;
wire        wb_s2m_ram_rty;
wire [31:0] wb_m2s_rom_adr;
wire [31:0] wb_m2s_rom_dat;
wire  [3:0] wb_m2s_rom_sel;
wire        wb_m2s_rom_we;
wire        wb_m2s_rom_cyc;
wire        wb_m2s_rom_stb;
wire  [2:0] wb_m2s_rom_cti;
wire  [1:0] wb_m2s_rom_bte;
wire [31:0] wb_s2m_rom_dat;
wire        wb_s2m_rom_ack;
wire        wb_s2m_rom_err;
wire        wb_s2m_rom_rty;
wire [31:0] wb_m2s_fw_interface_adr;
wire [31:0] wb_m2s_fw_interface_dat;
wire  [3:0] wb_m2s_fw_interface_sel;
wire        wb_m2s_fw_interface_we;
wire        wb_m2s_fw_interface_cyc;
wire        wb_m2s_fw_interface_stb;
wire  [2:0] wb_m2s_fw_interface_cti;
wire  [1:0] wb_m2s_fw_interface_bte;
wire [31:0] wb_s2m_fw_interface_dat;
wire        wb_s2m_fw_interface_ack;
wire        wb_s2m_fw_interface_err;
wire        wb_s2m_fw_interface_rty;

wb_intercon wb_intercon0
   (.wb_clk_i              (wb_clk),
    .wb_rst_i              (wb_rst),
    .wb_rv_adr_i           (wb_m2s_rv_adr),
    .wb_rv_dat_i           (wb_m2s_rv_dat),
    .wb_rv_sel_i           (wb_m2s_rv_sel),
    .wb_rv_we_i            (wb_m2s_rv_we),
    .wb_rv_cyc_i           (wb_m2s_rv_cyc),
    .wb_rv_stb_i           (wb_m2s_rv_stb),
    .wb_rv_cti_i           (wb_m2s_rv_cti),
    .wb_rv_bte_i           (wb_m2s_rv_bte),
    .wb_rv_dat_o           (wb_s2m_rv_dat),
    .wb_rv_ack_o           (wb_s2m_rv_ack),
    .wb_rv_err_o           (wb_s2m_rv_err),
    .wb_rv_rty_o           (wb_s2m_rv_rty),
    .wb_daq_master_adr_i   (wb_m2s_daq_master_adr),
    .wb_daq_master_dat_i   (wb_m2s_daq_master_dat),
    .wb_daq_master_sel_i   (wb_m2s_daq_master_sel),
    .wb_daq_master_we_i    (wb_m2s_daq_master_we),
    .wb_daq_master_cyc_i   (wb_m2s_daq_master_cyc),
    .wb_daq_master_stb_i   (wb_m2s_daq_master_stb),
    .wb_daq_master_cti_i   (wb_m2s_daq_master_cti),
    .wb_daq_master_bte_i   (wb_m2s_daq_master_bte),
    .wb_daq_master_dat_o   (wb_s2m_daq_master_dat),
    .wb_daq_master_ack_o   (wb_s2m_daq_master_ack),
    .wb_daq_master_err_o   (wb_s2m_daq_master_err),
    .wb_daq_master_rty_o   (wb_s2m_daq_master_rty),
    .wb_dsp_master_adr_i   (wb_m2s_dsp_master_adr),
    .wb_dsp_master_dat_i   (wb_m2s_dsp_master_dat),
    .wb_dsp_master_sel_i   (wb_m2s_dsp_master_sel),
    .wb_dsp_master_we_i    (wb_m2s_dsp_master_we),
    .wb_dsp_master_cyc_i   (wb_m2s_dsp_master_cyc),
    .wb_dsp_master_stb_i   (wb_m2s_dsp_master_stb),
    .wb_dsp_master_cti_i   (wb_m2s_dsp_master_cti),
    .wb_dsp_master_bte_i   (wb_m2s_dsp_master_bte),
    .wb_dsp_master_dat_o   (wb_s2m_dsp_master_dat),
    .wb_dsp_master_ack_o   (wb_s2m_dsp_master_ack),
    .wb_dsp_master_err_o   (wb_s2m_dsp_master_err),
    .wb_dsp_master_rty_o   (wb_s2m_dsp_master_rty),
    .wb_uart_adr_o         (wb_m2s_uart_adr),
    .wb_uart_dat_o         (wb_m2s_uart_dat),
    .wb_uart_sel_o         (wb_m2s_uart_sel),
    .wb_uart_we_o          (wb_m2s_uart_we),
    .wb_uart_cyc_o         (wb_m2s_uart_cyc),
    .wb_uart_stb_o         (wb_m2s_uart_stb),
    .wb_uart_cti_o         (wb_m2s_uart_cti),
    .wb_uart_bte_o         (wb_m2s_uart_bte),
    .wb_uart_dat_i         (wb_s2m_uart_dat),
    .wb_uart_ack_i         (wb_s2m_uart_ack),
    .wb_uart_err_i         (wb_s2m_uart_err),
    .wb_uart_rty_i         (wb_s2m_uart_rty),
    .wb_dsp_slave_adr_o    (wb_m2s_dsp_slave_adr),
    .wb_dsp_slave_dat_o    (wb_m2s_dsp_slave_dat),
    .wb_dsp_slave_sel_o    (wb_m2s_dsp_slave_sel),
    .wb_dsp_slave_we_o     (wb_m2s_dsp_slave_we),
    .wb_dsp_slave_cyc_o    (wb_m2s_dsp_slave_cyc),
    .wb_dsp_slave_stb_o    (wb_m2s_dsp_slave_stb),
    .wb_dsp_slave_cti_o    (wb_m2s_dsp_slave_cti),
    .wb_dsp_slave_bte_o    (wb_m2s_dsp_slave_bte),
    .wb_dsp_slave_dat_i    (wb_s2m_dsp_slave_dat),
    .wb_dsp_slave_ack_i    (wb_s2m_dsp_slave_ack),
    .wb_dsp_slave_err_i    (wb_s2m_dsp_slave_err),
    .wb_dsp_slave_rty_i    (wb_s2m_dsp_slave_rty),
    .wb_daq_slave_adr_o    (wb_m2s_daq_slave_adr),
    .wb_daq_slave_dat_o    (wb_m2s_daq_slave_dat),
    .wb_daq_slave_sel_o    (wb_m2s_daq_slave_sel),
    .wb_daq_slave_we_o     (wb_m2s_daq_slave_we),
    .wb_daq_slave_cyc_o    (wb_m2s_daq_slave_cyc),
    .wb_daq_slave_stb_o    (wb_m2s_daq_slave_stb),
    .wb_daq_slave_cti_o    (wb_m2s_daq_slave_cti),
    .wb_daq_slave_bte_o    (wb_m2s_daq_slave_bte),
    .wb_daq_slave_dat_i    (wb_s2m_daq_slave_dat),
    .wb_daq_slave_ack_i    (wb_s2m_daq_slave_ack),
    .wb_daq_slave_err_i    (wb_s2m_daq_slave_err),
    .wb_daq_slave_rty_i    (wb_s2m_daq_slave_rty),
    .wb_timer_adr_o        (wb_m2s_timer_adr),
    .wb_timer_dat_o        (wb_m2s_timer_dat),
    .wb_timer_sel_o        (wb_m2s_timer_sel),
    .wb_timer_we_o         (wb_m2s_timer_we),
    .wb_timer_cyc_o        (wb_m2s_timer_cyc),
    .wb_timer_stb_o        (wb_m2s_timer_stb),
    .wb_timer_cti_o        (wb_m2s_timer_cti),
    .wb_timer_bte_o        (wb_m2s_timer_bte),
    .wb_timer_dat_i        (wb_s2m_timer_dat),
    .wb_timer_ack_i        (wb_s2m_timer_ack),
    .wb_timer_err_i        (wb_s2m_timer_err),
    .wb_timer_rty_i        (wb_s2m_timer_rty),
    .wb_gpio_adr_o         (wb_m2s_gpio_adr),
    .wb_gpio_dat_o         (wb_m2s_gpio_dat),
    .wb_gpio_sel_o         (wb_m2s_gpio_sel),
    .wb_gpio_we_o          (wb_m2s_gpio_we),
    .wb_gpio_cyc_o         (wb_m2s_gpio_cyc),
    .wb_gpio_stb_o         (wb_m2s_gpio_stb),
    .wb_gpio_cti_o         (wb_m2s_gpio_cti),
    .wb_gpio_bte_o         (wb_m2s_gpio_bte),
    .wb_gpio_dat_i         (wb_s2m_gpio_dat),
    .wb_gpio_ack_i         (wb_s2m_gpio_ack),
    .wb_gpio_err_i         (wb_s2m_gpio_err),
    .wb_gpio_rty_i         (wb_s2m_gpio_rty),
    .wb_ram_adr_o          (wb_m2s_ram_adr),
    .wb_ram_dat_o          (wb_m2s_ram_dat),
    .wb_ram_sel_o          (wb_m2s_ram_sel),
    .wb_ram_we_o           (wb_m2s_ram_we),
    .wb_ram_cyc_o          (wb_m2s_ram_cyc),
    .wb_ram_stb_o          (wb_m2s_ram_stb),
    .wb_ram_cti_o          (wb_m2s_ram_cti),
    .wb_ram_bte_o          (wb_m2s_ram_bte),
    .wb_ram_dat_i          (wb_s2m_ram_dat),
    .wb_ram_ack_i          (wb_s2m_ram_ack),
    .wb_ram_err_i          (wb_s2m_ram_err),
    .wb_ram_rty_i          (wb_s2m_ram_rty),
    .wb_rom_adr_o          (wb_m2s_rom_adr),
    .wb_rom_dat_o          (wb_m2s_rom_dat),
    .wb_rom_sel_o          (wb_m2s_rom_sel),
    .wb_rom_we_o           (wb_m2s_rom_we),
    .wb_rom_cyc_o          (wb_m2s_rom_cyc),
    .wb_rom_stb_o          (wb_m2s_rom_stb),
    .wb_rom_cti_o          (wb_m2s_rom_cti),
    .wb_rom_bte_o          (wb_m2s_rom_bte),
    .wb_rom_dat_i          (wb_s2m_rom_dat),
    .wb_rom_ack_i          (wb_s2m_rom_ack),
    .wb_rom_err_i          (wb_s2m_rom_err),
    .wb_rom_rty_i          (wb_s2m_rom_rty),
    .wb_fw_interface_adr_o (wb_m2s_fw_interface_adr),
    .wb_fw_interface_dat_o (wb_m2s_fw_interface_dat),
    .wb_fw_interface_sel_o (wb_m2s_fw_interface_sel),
    .wb_fw_interface_we_o  (wb_m2s_fw_interface_we),
    .wb_fw_interface_cyc_o (wb_m2s_fw_interface_cyc),
    .wb_fw_interface_stb_o (wb_m2s_fw_interface_stb),
    .wb_fw_interface_cti_o (wb_m2s_fw_interface_cti),
    .wb_fw_interface_bte_o (wb_m2s_fw_interface_bte),
    .wb_fw_interface_dat_i (wb_s2m_fw_interface_dat),
    .wb_fw_interface_ack_i (wb_s2m_fw_interface_ack),
    .wb_fw_interface_err_i (wb_s2m_fw_interface_err),
    .wb_fw_interface_rty_i (wb_s2m_fw_interface_rty));

