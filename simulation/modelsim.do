exec make TARGET=${1} CPU=${2} clean
exec make TARGET=${1} CPU=${2}

vlib work


vlog ${1}.v +incdir+../testbench +define+${3}  +define+WISHBONE_CPU_${2}

vlog ../rtl/system_controller/system_controller.v +define+${3}

vlog ../rtl/picorv32_soc.v +incdir+../rtl/bus_matrix  +define+SIMULATION

vlog ../rtl/bus_matrix/soc_bus_matrix.v +incdir+../rtl/bus_matrix
vlog ../behavioral/wb_intercon/wb_arbiter.v +incdir+../rtl/bus_matrix +incdir+../behavioral/verilog_utils
vlog ../behavioral/wb_intercon/wb_mux.v +incdir+../rtl/bus_matrix +incdir+../behavioral/verilog_utils
vlog ../behavioral/verilog-arbiter/arbiter.v +incdir+../rtl/bus_matrix +incdir+../behavioral/verilog_utils

vlog ../testbench/testbench.v +incdir+../testbench 
vlog ../testbench/dump.v +incdir+../testbench 
vlog ../tasks/test_tasks.v +incdir+../testbench

vlog ../behavioral/wb_bfm/wb_bfm_master.v +incdir+../behavioral/wb_bfm +incdir+../testbench
      
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

vlog ../behavioral/wb_master/wb_master_model.v +incdir+../testbench

vlog ../rtl/wb_ram/rtl/verilog/wb_ram.v +incdir+../behavioral/wb_common/ +define+${3}
vlog ../rtl/wb_ram/rtl/verilog/wb_rom.v +incdir+../behavioral/wb_common/ +define+${3}
vlog ../rtl/wb_ram/rtl/verilog/wb_ram_generic.v +incdir+../behavioral/wb_common/


vlog ../rtl/picorv32/picorv32.v  +incdir+../rtl/picorv32 +incdir+../rtl/includes/  +define+WISHBONE_CPU_${2}

vlog ../testbench/fw_interface/fw_interface.v +incdir+../testbench
vlog ../testbench/fw_interface/fw_interface_wb.v +incdir+../testbench +define+WISHBONE_CPU_${2}
vlog ../testbench/fw_interface/fw_interface_logic.v +incdir+../testbench +define+SIMULATION -timescale "1ns/1ns"
vlog ../rtl/tools/edge_detection.v +incdir+../testbench



if {${3} == "XILINX"} {
   do xilinx.do
   vsim -voptargs=+acc work.testbench work.glbl +define+XILINX +undef+DATA_BUS_WIDTH_8 +define+WISHBONE_CPU_${2}
}

if {${3} == "ALTERA"} {
   do altera.do         
   vsim -voptargs=+acc -L altera_mf_ver -t ps work.testbench work.glbl +define+ALTERA +undef+DATA_BUS_WIDTH_8 +define+WISHBONE_CPU_${2}
}

if {${3} == "RTL"} {
   vsim -voptargs=+acc work.testbench  +define+RTL +undef+DATA_BUS_WIDTH_8 +define+WISHBONE_CPU_${2}
}



do wave.do
run -all
