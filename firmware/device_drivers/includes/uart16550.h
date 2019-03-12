#ifndef __UART_16550_H__
#define __UART_16550_H__

typedef union{
  uint8_t data;
  uint8_t divisor_lsb;
}UART16550_REG0_TypeDef;

typedef union{
  uint8_t interrupt_enable;
  uint8_t divisor_msb;
}UART16550_REG1_TypeDef;

typedef union{
  uint8_t interrupt_identifier;
  uint8_t fifo_control; 
} UART16550_REG2_TypeDef;

typedef struct __attribute__ ((__packed__)) {
  volatile UART16550_REG0_TypeDef reg0;
  volatile UART16550_REG1_TypeDef reg1;
  volatile UART16550_REG2_TypeDef reg2;
  volatile uint8_t line_control;
  volatile uint8_t modem_control;
  volatile uint8_t line_status;
  volatile uint8_t modem_status;
  volatile uint8_t reserved0;
  volatile uint32_t debug1;
  volatile uint32_t debug2;
} UART16550_REGS_TypeDef;

//
// Interrupt Enable Bits
//
#define UART16550_INTERRUPT_ENABLE_DATA_RECEIVED (0x01)
#define UART16550_INTERRUPT_ENABLE_TRANSMIT_EMPTY (0x02)
#define UART16550_INTERRUPT_ENABLE_RECEIVER_LINE (0x04)
#define UART16550_INTERRUPT_ENABLE_MODEM_STATUS (0x08)

//
// Interrupt Identification Bits
//
#define UART16550_INTERRUPT_IDENTIFICATION_RECEIVER_LINE  (0xC6)
#define UART16550_INTERRUPT_IDENTIFICATION_DATA_RECEIVED  (0xC4)
#define UART16550_INTERRUPT_IDENTIFICATION_TIMEOUT        (0xCC)
#define UART16550_INTERRUPT_IDENTIFICATION_TRANSMIT_EMPTY (0xC2)
#define UART16550_INTERRUPT_IDENTIFICATION_MODEM_STATUS   (0xC0)

//
// FIFO Control
//
#define UART16550_FIFO_CONTROL_CLEAR_RECIEVER (0x01)
#define UART16550_FIFO_CONTROL_CLEAR_TRANSMIT (0x02)
#define UART16550_FIFO_CONTROL_RX_TRIGGER_1   (0x00)
#define UART16550_FIFO_CONTROL_RX_TRIGGER_4   (0x40)
#define UART16550_FIFO_CONTROL_RX_TRIGGER_8   (0x80)
#define UART16550_FIFO_CONTROL_RX_TRIGGER_14  (0xC0)

//
// Line Control Register
//
#define UART16550_LINE_CONTROL_5BITS  (0x00)
#define UART16550_LINE_CONTROL_6BITS  (0x01)
#define UART16550_LINE_CONTROL_7BITS  (0x02)
#define UART16550_LINE_CONTROL_8BITS  (0x03)
#define UART16550_LINE_CONTROL_1_STOP (0x00)
#define UART16550_LINE_CONTROL_2_STOP (0x04)
#define UART16550_LINE_CONTROL_PARITY_ENABLE (0x08)
#define UART16550_LINE_CONTROL_1_EVEN_PARITY (0x10)
#define UART16550_LINE_CONTROL_STICK_PARITY  (0x20)
#define UART16550_LINE_CONTROL_BREAK         (0x40)
#define UART16550_LINE_CONTROL_DLAB          (0x80)

//
// Modem Control Register
//
#define UART16550_MODEM_CONTROL_DTR  (0x01)
#define UART16550_MODEM_CONTROL_RTS  (0x02)
#define UART16550_MODEM_CONTROL_OUT1 (0x04)
#define UART16550_MODEM_CONTROL_OUT2 (0x08)
#define UART16550_MODEM_CONTROL_LOOPBACK (0x10)

//
// Line Status Register
//
#define UART16550_LINE_STATUS_DATA_READY (0x01)
#define UART16550_LINE_STATUS_OVERRUN    (0x02)
#define UART16550_LINE_STATUS_PARITY     (0x04)
#define UART16550_LINE_STATUS_FRAMING    (0x08)
#define UART16550_LINE_STATUS_BREAK      (0x10)
#define UART16550_LINE_STATUS_TX_FIFO    (0x20)
#define UART16550_LINE_STATUS_TX         (0x40)
#define UART16550_LINE_STATUS_ANY        (0x80)

//
// Modem Status Register
//
#define UART16550_MODEM_STATUS_DCTS (0x01)
#define UART16550_MODEM_STATUS_DDSR (0x02)
#define UART16550_MODEM_STATUS_TERI (0x04)
#define UART16550_MODEM_STATUS_DDCD (0x08)
#define UART16550_MODEM_STATUS_COMPLEMENT_CTS (0x10)
#define UART16550_MODEM_STATUS_COMPLEMENT_DST (0x20)
#define UART16550_MODEM_STATUS_COMPLEMENT_RI (0x40)
#define UART16550_MODEM_STATUS_COMPLEMENT_DCD (0x80)

void UART16550_Init(UART16550_REGS_TypeDef * uart);
void UART16550_SetDivisor(UART16550_REGS_TypeDef * uart, uint16_t divisor);
void UART16550_TransmitByte(UART16550_REGS_TypeDef * uart, uint8_t byte);
void UART16550_ReceiveByte(UART16550_REGS_TypeDef * uart, uint8_t * byte);
void UART16550_PollForReceive(UART16550_REGS_TypeDef * uart);
void UART16550_InterruptEnable(UART16550_REGS_TypeDef * uart, uint8_t irq);
void UART16550_InterruptDisable(UART16550_REGS_TypeDef * uart, uint8_t irq);
#endif
