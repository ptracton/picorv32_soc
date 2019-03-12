#ifndef __FW_INTERFACE_H__
#define __FW_INTERFACE_H__

#define FW_INTERFACE_MAX_CHARS 32

typedef struct __attribute__ ((__packed__)){
  volatile uint32_t control;
  volatile uint32_t report;
  volatile uint32_t warning;
  volatile uint32_t error;
  volatile uint32_t measured;
  volatile uint32_t expected;
  volatile uint32_t trigger;
  volatile uint8_t string[FW_INTERFACE_MAX_CHARS];
} FW_INTERFACE_REGS_TypeDef;

//
// Control Reg Bits
//
#define FW_INTERFACE_CONTROL_REG_NEW_REPORT   (0x00000001)
#define FW_INTERFACE_CONTROL_REG_NEW_WARNING  (0x00000002)
#define FW_INTERFACE_CONTROL_REG_NEW_ERROR    (0x00000004)
#define FW_INTERFACE_CONTROL_REG_NEW_COMPARE  (0x00000008)

//
// Function Prototypes
//
void FW_report(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t report);
void FW_warning(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message,  uint32_t warning);
void FW_error(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t error);
void FW_compare(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t measured, uint32_t expected);
void FW_trigger(volatile FW_INTERFACE_REGS_TypeDef * dev, uint32_t trigger);
void FW_Init(volatile FW_INTERFACE_REGS_TypeDef * dev);
#endif
