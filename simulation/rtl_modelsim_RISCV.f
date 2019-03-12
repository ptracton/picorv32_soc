vlib work


vlog ../rtl/soc_template.v +incdir+../rtl/bus_matrix

vlog ../rtl/system_controller/system_controller.v

vlog ../rtl/bus_matrix/soc_bus_matrix.v +incdir+../rtl/bus_matrix
vlog ../behvioral/wb_intercon/wb_arbiter.v +incdir+../rtl/bus_matrix +incdir+../behvioral/verilog_utils
vlog ../behvioral/wb_intercon/wb_mux.v +incdir+../rtl/bus_matrix +incdir+../behvioral/verilog_utils
vlog ../behvioral/verilog-arbiter/arbiter.v +incdir+../rtl/bus_matrix +incdir+../behvioral/verilog_utils

vlog ../testbench/testbench.v +incdir+../testbench 
vlog ../testbench/dump.v +incdir+../testbench 
vlog ../tasks/test_tasks.v +incdir+../testbench

vlog ../behvioral/wb_bfm/wb_bfm_master.v +incdir+../behvioral/wb_bfm +incdir+../testbench
      
vlog ../rtl/uart16550/rtl/verilog/raminfr.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_debug_if.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_receiver.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_regs.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_rfifo.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_sync_flops.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_tfifo.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_top.v +incdir+../rtl/uart16550/rtl/verilog/ 
vlog ../rtl/uart16550/rtl/verilog/uart_transmitter.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../rtl/uart16550/rtl/verilog/uart_wb.v +incdir+../rtl/uart16550/rtl/verilog/
vlog ../tasks/uart_tasks.v +incdir+../rtl/uart16550/rtl/verilog/

vlog ../behvioral/wb_master/wb_master_model.v +incdir+../testbench

vlog ../rtl/wb_ram/rtl/verilog/wb_ram.v +incdir+../behvioral/wb_common/
vlog ../rtl/wb_ram/rtl/verilog/wb_ram.v +incdir+../behvioral/wb_common/
vlog ../rtl/wb_ram/rtl/verilog/wb_ram_generic.v +incdir+../behvioral/wb_common/


vlog ../rtl/cpu/cpu_wrapper.v +incdir+../rtl/cpu/ +incdir+../rtl/includes/ +define+WISHBONE_CPU_RISCV


do ../rtl/RISCV/RISCV_rtl.do

vsim -voptargs=+acc work.testbench +define+XILINX +undef+DATA_BUS_WIDTH_8 +define+WISHBONE_CPU_RISCV
run -all
