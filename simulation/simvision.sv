# SimVision Command Script (Fri Mar 08 17:48:16 CST 2019)
#
# Version 15.20.s018
#
# You can restore this configuration with:
#
#     simvision -input simvision.sv
#


#
# Preferences
#
preferences set enable_approximation 0
preferences set signal_to_display {haptix_testbench.PCv[31:0]}
preferences set toolbar-Standard-WatchWindow {
  usual
  shown 0
}
preferences set toolbar-SimControl-WatchList {
  usual
  hide set_break
}
preferences set toolbar-SimControl-SrcBrowser {
  usual
  show coverage
}
preferences set txe-locate-add-fibers 1
preferences set signal-type-colors {assertion #FF0000 output #FFA500 group #0099FF inout #00FFFF input #FFFF00 fiber #00EEEE errorsignal #FF0000 unknown #FFFFFF overlay #0099FF internal #00FF00 reference #FFFFFF}
preferences set txe-view-hold 0
preferences set txe-navigate-search-locate 0
preferences set plugin-enable-svdatabrowser-new 1
preferences set cursorctl-dont-show-sync-warning 1
preferences set toolbar-Windows-WatchWindow {
  usual
  shown 0
}
preferences set approximation_distance 3
preferences set verilog-colors {Su #ff0099 0 {} 1 {} HiZ #ff9900 We #00ffff Pu #9900ff Sm #00ff99 X #ff0000 StrX #ff0000 other #ffff00 Z #ff9900 Me #0000ff La #ff00ff St {}}
preferences set user-toolbar-list {SrcBrowser {} WaveWindow {}}
preferences set toolbar-SimControl-SchematicWindow {
  usual
  hide vplan
}
preferences set enable_mix_trace 0
preferences set enable_dis_trace 0
preferences set enable_src_trace 1
preferences set txe-navigate-waveform-locate 1
preferences set txe-view-hidden 0
preferences set approximation_resolution 4
preferences set txe-search-show-linenumbers 1
preferences set toolbar-OperatingMode-WaveWindow {
  usual
  position -pos 5
  name OperatingMode
}
preferences set plugin-enable-svdatabrowser 0
preferences set toolbar-Standard-WaveWindow {
  usual
  position -pos 1
}
preferences set plugin-enable-groupscope 0
preferences set key-bindings {Edit>Undo Ctrl+z PageUp PageUp View>Zoom>In Alt+i PageDown PageDown Edit>Copy Ctrl+c ScrollDown {Down arrow} Edit>Create>Group Ctrl+g View>Zoom>FullY_widget y Simulation>NextInScope F7 Edit>Select>All Ctrl+a Edit>Ungroup Ctrl+Shift+G Format>Radix>Decimal Ctrl+Shift+D TopOfPage Home Edit>Create>Condition Ctrl+e {command -console SimVision {%w sidebar access designbrowser selectall}} Alt+a ScrollLeft {Left arrow} Edit>SelectAllText Alt+a Edit>TextSearchConsole Alt+s View>Zoom>FullX_widget = Windows>SendTo>Waveform Ctrl+w Simulation>Return Shift+F5 View>CallstackDown {Ctrl+Down arrow} Select>All Ctrl+a Edit>Delete Del Edit>Cut Ctrl+x Simulation>Run F2 Edit>Create>Marker Ctrl+m Format>Radix>Octal Ctrl+Shift+O View>Center Alt+c View>CallstackInWindow Ctrl+k Edit>SelectAll Ctrl+a File>OpenDatabase Ctrl+o Edit>Redo Ctrl+y View>ExpandSequenceTime>AtCursor Alt+x Format>Radix>Binary Ctrl+Shift+B ScrollUp {Up arrow} File>CloseWindow Ctrl+Shift+w ScrollRight {Right arrow} View>Zoom>FullX Alt+= Edit>Create>Bus Ctrl+b Explore>NextEdge Ctrl+\] View>Zoom>Cursor-Baseline Alt+z View>Zoom>OutX Alt+o Edit>GoToLine Ctrl+g View>Zoom>Fit Alt+= View>Zoom>OutX_widget o View>CallstackUp {Ctrl+Up arrow} View>Bookmarks>Add Ctrl+b View>ShowValues Ctrl+s Simulation>Next F6 Format>Radix>Hexadecimal Ctrl+Shift+H Edit>Create>MarkerAtCursor Ctrl+Shift+M View>Zoom>InX Alt+i View>Zoom>Out Alt+o Edit>TextSearch Ctrl+f Edit>Paste Ctrl+v Format>Signed Ctrl+Shift+S View>CollapseSequenceTime>AtCursor Alt+s View>Zoom>InX_widget i Format>Radix>ASCII Ctrl+Shift+A Explore>PreviousEdge {Ctrl+[} Simulation>Step F5 BottomOfPage End}
preferences set user_src_table /data/pace/hpc_scratch/vol1/tractp1/NGMCU/svn/neuro_cortex_hardware/mfic25hv/verification/sim_digital/tests/haptix_system_fw/haptix/inc/app_long6.lst.s
preferences set dont-show-drm-infobubble 1
preferences set plugin-enable-interleaveandcompare 0
preferences set plugin-enable-waveformfrequencyplot 0
preferences set toolbar-SimControl-WatchWindow {
  usual
  hide set_break
  hide vplan
  shown 0
}
preferences set txe-navigate-waveform-next-child 1
preferences set toolbar-Edit-WatchWindow {
  usual
  shown 0
}
preferences set vhdl-colors {H #00ffff L #00ffff 0 {} X #ff0000 - {} 1 {} U #9900ff Z #ff9900 W #ff0000}
preferences set txe-locate-scroll-x 1
preferences set txe-locate-scroll-y 1
preferences set txe-locate-pop-waveform 1
preferences set whats-new-dont-show-at-startup 1
preferences set toolbar-TimeSearch-WatchWindow {
  usual
  shown 0
}
preferences set tool_mode USER
preferences set verbose 0
preferences set toolbar-SimControl-MemViewer {
  usual
  hide vplan
}

#
# Databases
#
database require boot_rom -search {
	./boot_rom.shm/boot_rom.trn
	/data/pace/hpc_scratch_vol1/tractp1/hardware/picorv32-soc/simulation/boot_rom.shm/boot_rom.trn
}
#
# Groups
#
catch {group new -name {FW IF TOP} -overlay 0}
catch {group new -name {CPU DEBGU} -overlay 0}
catch {group new -name {DUT UART TOP} -overlay 0}
catch {group new -name {TB UART} -overlay 0}
catch {group new -name {DUT UART} -overlay 0}
group using {FW IF TOP}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
     {boot_rom::testbench.dut.fw_if.data[7:0]}  \
     {boot_rom::testbench.dut.fw_if.error_reg[31:0]}  \
     {boot_rom::testbench.dut.fw_if.expected_reg[31:0]}  \
     {boot_rom::testbench.dut.fw_if.index[5:0]}  \
     {boot_rom::testbench.dut.fw_if.interrupts[31:0]}  \
     {boot_rom::testbench.dut.fw_if.measured_reg[31:0]}  \
     boot_rom::testbench.dut.fw_if.new_compare  \
     boot_rom::testbench.dut.fw_if.new_error  \
     boot_rom::testbench.dut.fw_if.new_report  \
     boot_rom::testbench.dut.fw_if.new_warning  \
     {boot_rom::testbench.dut.fw_if.report_reg[31:0]}  \
     {boot_rom::testbench.dut.fw_if.trigger_reg[31:0]}  \
     {boot_rom::testbench.dut.fw_if.warning_reg[31:0]}  \
     boot_rom::testbench.dut.fw_if.wb_clk_i  \
     {boot_rom::testbench.dut.fw_if.wb_adr_i[31:0]}  \
     boot_rom::testbench.dut.fw_if.write_mem  \
     boot_rom::testbench.dut.fw_if.wb_cyc_i  \
     boot_rom::testbench.dut.fw_if.wb_stb_i  \
     boot_rom::testbench.dut.fw_if.wb_we_i  \
     boot_rom::testbench.dut.fw_if.wb_ack_o  \
     {boot_rom::testbench.dut.fw_if.wb_dat_i[31:0]}  \
     {boot_rom::testbench.dut.fw_if.wb_dat_o[31:0]}  \
     boot_rom::testbench.dut.fw_if.wb_err_o  \
     {boot_rom::testbench.dut.fw_if.wb_sel_i[3:0]} 
group using {CPU DEBGU}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_ascii_instr[63:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_ascii_state[127:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_addr[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_imm[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_opcode[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rd[4:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rs1[4:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rs2[4:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_addr[31:0]}  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_instr  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_rdata[31:0]}  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_ready  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_valid  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_wdata[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_wstrb[3:0]}  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_next  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x0[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x1[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x2[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x3[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x4[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x5[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x6[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x7[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x8[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x9[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x10[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x11[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x12[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x13[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x14[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x15[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x16[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x17[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x18[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x19[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x20[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x21[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x22[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x23[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x24[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x25[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x26[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x27[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x28[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x29[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x30[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x31[31:0]}  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs1val[31:0]}  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs1val_valid  \
     {boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs2val[31:0]}  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs2val_valid  \
     boot_rom::testbench.dut.cpu.picorv32_core.dbg_valid_insn 
group using {DUT UART TOP}
group set -overlay 0
group set -comment {}
group clear 0 end

group using {TB UART}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
     boot_rom::testbench.uart0.baud_o  \
     boot_rom::testbench.uart0.cts_pad_i  \
     boot_rom::testbench.uart0.dcd_pad_i  \
     boot_rom::testbench.uart0.dsr_pad_i  \
     boot_rom::testbench.uart0.dtr_pad_o  \
     {boot_rom::testbench.uart0.fcr[1:0]}  \
     {boot_rom::testbench.uart0.ier[3:0]}  \
     {boot_rom::testbench.uart0.iir[3:0]}  \
     boot_rom::testbench.uart0.int_o  \
     {boot_rom::testbench.uart0.lcr[7:0]}  \
     {boot_rom::testbench.uart0.lsr[7:0]}  \
     {boot_rom::testbench.uart0.mcr[4:0]}  \
     {boot_rom::testbench.uart0.msr[7:0]}  \
     boot_rom::testbench.uart0.re_o  \
     {boot_rom::testbench.uart0.rf_count[4:0]}  \
     boot_rom::testbench.uart0.ri_pad_i  \
     {boot_rom::testbench.uart0.rstate[3:0]}  \
     boot_rom::testbench.uart0.rts_pad_o  \
     boot_rom::testbench.uart0.srx_pad_i  \
     boot_rom::testbench.uart0.stx_pad_o  \
     {boot_rom::testbench.uart0.tf_count[4:0]}  \
     {boot_rom::testbench.uart0.tstate[2:0]}  \
     boot_rom::testbench.uart0.wb_ack_o  \
     {boot_rom::testbench.uart0.wb_adr_i[4:0]}  \
     {boot_rom::testbench.uart0.wb_adr_int[4:0]}  \
     boot_rom::testbench.uart0.wb_clk_i  \
     boot_rom::testbench.uart0.wb_cyc_i  \
     {boot_rom::testbench.uart0.wb_dat8_i[7:0]}  \
     {boot_rom::testbench.uart0.wb_dat8_o[7:0]}  \
     {boot_rom::testbench.uart0.wb_dat32_o[31:0]}  \
     {boot_rom::testbench.uart0.wb_dat_i[31:0]}  \
     {boot_rom::testbench.uart0.wb_dat_o[31:0]}  \
     boot_rom::testbench.uart0.wb_rst_i  \
     {boot_rom::testbench.uart0.wb_sel_i[3:0]}  \
     boot_rom::testbench.uart0.wb_stb_i  \
     boot_rom::testbench.uart0.wb_we_i  \
     boot_rom::testbench.uart0.we_o 
group using {DUT UART}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
     boot_rom::testbench.dut.uart.baud_o  \
     boot_rom::testbench.dut.uart.cts_pad_i  \
     boot_rom::testbench.dut.uart.dcd_pad_i  \
     boot_rom::testbench.dut.uart.dsr_pad_i  \
     boot_rom::testbench.dut.uart.dtr_pad_o  \
     {boot_rom::testbench.dut.uart.fcr[1:0]}  \
     {boot_rom::testbench.dut.uart.ier[3:0]}  \
     {boot_rom::testbench.dut.uart.iir[3:0]}  \
     boot_rom::testbench.dut.uart.int_o  \
     {boot_rom::testbench.dut.uart.lcr[7:0]}  \
     {boot_rom::testbench.dut.uart.lsr[7:0]}  \
     {boot_rom::testbench.dut.uart.mcr[4:0]}  \
     {boot_rom::testbench.dut.uart.msr[7:0]}  \
     boot_rom::testbench.dut.uart.re_o  \
     {boot_rom::testbench.dut.uart.rf_count[4:0]}  \
     boot_rom::testbench.dut.uart.ri_pad_i  \
     {boot_rom::testbench.dut.uart.rstate[3:0]}  \
     boot_rom::testbench.dut.uart.rts_pad_o  \
     boot_rom::testbench.dut.uart.srx_pad_i  \
     boot_rom::testbench.dut.uart.stx_pad_o  \
     {boot_rom::testbench.dut.uart.tf_count[4:0]}  \
     {boot_rom::testbench.dut.uart.tstate[2:0]}  \
     boot_rom::testbench.dut.uart.wb_ack_o  \
     {boot_rom::testbench.dut.uart.wb_adr_i[4:0]}  \
     {boot_rom::testbench.dut.uart.wb_adr_int[4:0]}  \
     boot_rom::testbench.dut.uart.wb_clk_i  \
     boot_rom::testbench.dut.uart.wb_cyc_i  \
     {boot_rom::testbench.dut.uart.wb_dat8_i[7:0]}  \
     {boot_rom::testbench.dut.uart.wb_dat8_o[7:0]}  \
     {boot_rom::testbench.dut.uart.wb_dat32_o[31:0]}  \
     {boot_rom::testbench.dut.uart.wb_dat_i[31:0]}  \
     {boot_rom::testbench.dut.uart.wb_dat_o[31:0]}  \
     boot_rom::testbench.dut.uart.wb_rst_i  \
     {boot_rom::testbench.dut.uart.wb_sel_i[3:0]}  \
     boot_rom::testbench.dut.uart.wb_stb_i  \
     boot_rom::testbench.dut.uart.wb_we_i  \
     boot_rom::testbench.dut.uart.we_o 

#
# Mnemonic Maps
#
mmap new -reuse -name {Boolean as Logic} -radix %b -contents {{%c=FALSE -edgepriority 1 -shape low}
{%c=TRUE -edgepriority 1 -shape high}}
mmap new -reuse -name {Example Map} -radix %x -contents {{%b=11???? -bgcolor orange -label REG:%x -linecolor yellow -shape bus}
{%x=1F -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=2C -bgcolor red -label ERROR -linecolor white -shape EVENT}
{%x=* -label %x -linecolor gray -shape bus}}

#
# Waveform windows
#
if {[catch {window new WaveWindow -name "Waveform 1" -geometry 1920x1059+0+49}] != ""} {
    window geometry "Waveform 1" 1920x1059+0+49
}
window target "Waveform 1" on
waveform using {Waveform 1}
waveform sidebar select designbrowser
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units ns \
    -valuewidth 75
waveform baseline set -time 21,575,000ps


set groupId0 [waveform add -groups {{CPU DEBGU}}]
set gpGlist0 [waveform hierarchy contents $groupId0]
set gpID0 [lindex $gpGlist0 0]
foreach {name attrs}  {
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_ascii_instr[63:0]} {-radix %a}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_ascii_state[127:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_addr[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_imm[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_opcode[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rd[4:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rs1[4:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_insn_rs2[4:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_addr[31:0]} {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_instr {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_rdata[31:0]} {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_ready {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_valid {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_wdata[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_mem_wstrb[3:0]} {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_next {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x0[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x1[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x2[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x3[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x4[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x5[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x6[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x7[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x8[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x9[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x10[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x11[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x12[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x13[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x14[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x15[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x16[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x17[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x18[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x19[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x20[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x21[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x22[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x23[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x24[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x25[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x26[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x27[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x28[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x29[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x30[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_reg_x31[31:0]} {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs1val[31:0]} {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs1val_valid {}
    {boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs2val[31:0]} {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_rs2val_valid {}
    boot_rom::testbench.dut.cpu.picorv32_core.dbg_valid_insn {}
} childcmds {
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
} {
    set expected [ join [waveform signals -format fullpath $gpID0] ]
    if {[string equal $name $expected] || $name == "cdivider"} {
        if {$attrs != ""} {
            eval waveform format $gpID0 $attrs
        }
        if { $childcmds != ""} {
            eval $childcmds
        }
    }
    set gpGlist0 [lrange $gpGlist0 1 end]
    set gpID0 [lindex $gpGlist0 0]
}
waveform hierarchy collapse $groupId0


set groupId0 [waveform add -groups {{FW IF TOP}}]
set gpGlist0 [waveform hierarchy contents $groupId0]
set gpID0 [lindex $gpGlist0 0]
foreach {name attrs}  {
    {boot_rom::testbench.dut.fw_if.data[7:0]} {}
    {boot_rom::testbench.dut.fw_if.error_reg[31:0]} {}
    {boot_rom::testbench.dut.fw_if.expected_reg[31:0]} {}
    {boot_rom::testbench.dut.fw_if.index[5:0]} {}
    {boot_rom::testbench.dut.fw_if.interrupts[31:0]} {}
    {boot_rom::testbench.dut.fw_if.measured_reg[31:0]} {}
    boot_rom::testbench.dut.fw_if.new_compare {}
    boot_rom::testbench.dut.fw_if.new_error {}
    boot_rom::testbench.dut.fw_if.new_report {-color #9900ff}
    boot_rom::testbench.dut.fw_if.new_warning {}
    {boot_rom::testbench.dut.fw_if.report_reg[31:0]} {}
    {boot_rom::testbench.dut.fw_if.trigger_reg[31:0]} {}
    {boot_rom::testbench.dut.fw_if.warning_reg[31:0]} {}
    boot_rom::testbench.dut.fw_if.wb_clk_i {}
    {boot_rom::testbench.dut.fw_if.wb_adr_i[31:0]} {}
    boot_rom::testbench.dut.fw_if.write_mem {}
    boot_rom::testbench.dut.fw_if.wb_cyc_i {}
    boot_rom::testbench.dut.fw_if.wb_stb_i {}
    boot_rom::testbench.dut.fw_if.wb_we_i {}
    boot_rom::testbench.dut.fw_if.wb_ack_o {}
    {boot_rom::testbench.dut.fw_if.wb_dat_i[31:0]} {}
    {boot_rom::testbench.dut.fw_if.wb_dat_o[31:0]} {}
    boot_rom::testbench.dut.fw_if.wb_err_o {}
    {boot_rom::testbench.dut.fw_if.wb_sel_i[3:0]} {}
} childcmds {
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
    {}
} {
    set expected [ join [waveform signals -format fullpath $gpID0] ]
    if {[string equal $name $expected] || $name == "cdivider"} {
        if {$attrs != ""} {
            eval waveform format $gpID0 $attrs
        }
        if { $childcmds != ""} {
            eval $childcmds
        }
    }
    set gpGlist0 [lrange $gpGlist0 1 end]
    set gpID0 [lindex $gpGlist0 0]
}


set groupId0 [waveform add -groups {{TB UART}}]
waveform hierarchy collapse $groupId0


set groupId0 [waveform add -groups {{DUT UART}}]


waveform xview limits 0 3637435ns

#
# Waveform Window Links
#

#
# Layout selection
#

