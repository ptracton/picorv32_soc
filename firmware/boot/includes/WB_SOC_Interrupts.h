#ifndef __WB_SOC_INTERRUPTS_H__
#define __WB_SOC_INTERRUPTS_H__


//
// Wrap up the LM32 Mico Interrupt calls so we can be platform neutral
//
//#define WB_SOC_Interrupt_Init int_init
//#define WB_SOC_InstallHandler(X,Y,Z)  int_add(X,Y,Z)
//#define WB_SOC_DisableInterrupt int_disable
//#define WB_SOC_EnableInterrupt int_enable
//#define WB_SOC_CPUEnableInterrupt(x)  cpu_enable_user_interrupts()
//#define WB_SOC_CPUDisableInterrupt MicoDisableInterrupts
#endif
