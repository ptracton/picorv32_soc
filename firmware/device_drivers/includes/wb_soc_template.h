#ifndef __WB_SOC_TEMPLATE_H__
#define __WB_SOC_TEMPLATE_H__


#include <stdlib.h>
#include <sys/types.h>


#define UNUSED(x) (void)(x)


#define uint8_t  unsigned char
#define uint16_t unsigned short
#define uint32_t unsigned long


#include "uart16550.h"
#include "fw_interface.h"

//
// Addresses of peripheral devices in the system
// See wb_soc_template/rtl/bus_matrix/soc_template.conf for details
//
#define ROM_BASE_ADDRESS     0x00000000
#define RAM_BASE_ADDRESS     0x20000000
#define UART_BASE_ADDRESS    0x40000000
#define FW_INTERFACE_BASE_ADDRESS 0xE0000000

#define UART ((UART16550_REGS_TypeDef *) UART_BASE_ADDRESS)
#define FW_IF ((FW_INTERFACE_REGS_TypeDef *) FW_INTERFACE_BASE_ADDRESS)


//
// Interrupts
//
#define INTERRUPT_UART (0x02)

#endif
