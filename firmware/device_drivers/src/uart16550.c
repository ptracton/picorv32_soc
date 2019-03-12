
#include "wb_soc_template.h"

void UART16550_Init(UART16550_REGS_TypeDef * uart){

 
  //
  // FIFO Control, interrupt for each byte and clear FIFOs
  //
  uart->reg2.fifo_control = (UART16550_FIFO_CONTROL_CLEAR_RECIEVER | 
                             UART16550_FIFO_CONTROL_CLEAR_TRANSMIT |
                             UART16550_FIFO_CONTROL_RX_TRIGGER_1); 
  //
  // Set baud rate divisor
  //
  UART16550_SetDivisor(UART, 0x001A);

  //
  // Line Control Register 8 data, 1 stop, no parity
  //
  uart->line_control |= (UART16550_LINE_CONTROL_8BITS |
                         UART16550_LINE_CONTROL_1_STOP);
  return;
}

void UART16550_InterruptEnable(UART16550_REGS_TypeDef * uart, uint8_t irq){
  //
  //Turn on Interrupt
  //
  uart->reg1.interrupt_enable |= irq;
    
  return;
}

void UART16550_InterruptDisable(UART16550_REGS_TypeDef * uart, uint8_t irq){
  //
  //Turn off  Interrupt
  //
  uart->reg1.interrupt_enable &= ~irq;
    
  return;
}


void UART16550_SetDivisor(UART16550_REGS_TypeDef * uart, uint16_t divisor){
  //
  // Line Control enable writing to baud rate registers
  //
  uart->line_control |= UART16550_LINE_CONTROL_DLAB;

  //
  // Writing baud rate to low byte
  //
  uart->reg0.divisor_lsb = divisor & 0x00FF;

  //
  // Writing baud rate to the high byte
  //
  uart->reg1.divisor_msb = 0;//(divisor & 0xFF00) >> 8;

  //
  // Disable DLAB bit
  //
  uart->line_control &= ~UART16550_LINE_CONTROL_DLAB;
  
  return;
}

void UART16550_TransmitByte(UART16550_REGS_TypeDef * uart, uint8_t byte){

  //
  // Disable DLAB bit
  //
  uart->line_control &= ~UART16550_LINE_CONTROL_DLAB;
  
  //
  // Write byte to transmit FIFO
  //
  uart->reg0.data = byte;

  //
  // Wait for FIFO and Transmitter to be empty
  //
  while ((uart->line_status & UART16550_LINE_STATUS_TX) == 0);
  
  return;
}

void UART16550_ReceiveByte(UART16550_REGS_TypeDef * uart, uint8_t * byte){
  *byte = uart->reg0.data;
  return;
}

void UART16550_PollForReceive(UART16550_REGS_TypeDef * uart){

  //
  // We poll forever until a character has been received
  //
  while ((uart->line_status & UART16550_LINE_STATUS_DATA_READY) ==0);
  
  return;
}
