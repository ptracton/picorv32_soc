
#include "wb_soc_template.h"

#include "WB_SOC_Interrupts.h"

void uart_irq_handler(unsigned int data, void * context){
  uint8_t byte;
  
  UNUSED(data);
  UNUSED(context);
  FW_report(FW_IF, "IRQ", 0);
  if (UART->reg2.interrupt_identifier & UART16550_INTERRUPT_IDENTIFICATION_DATA_RECEIVED){
    UART16550_ReceiveByte(UART, &byte);
    UART16550_TransmitByte(UART, byte);
  }
  return;
}


int main(void){

  FW_Init(FW_IF);
  FW_report(FW_IF, "Booting UART Interrupt", 0xdeadbeef);
  UART16550_Init(UART);
  UART16550_InterruptEnable(UART,  UART16550_INTERRUPT_ENABLE_DATA_RECEIVED);
  
  WB_SOC_Interrupt_Init();  
  WB_SOC_InstallHandler(INTERRUPT_UART, &uart_irq_handler, (void *) NULL);
  WB_SOC_EnableInterrupt(INTERRUPT_UART);
  WB_SOC_CPUEnableInterrupt();
  
  FW_trigger(FW_IF, 0x01);
  while(1){
  };
  
  return 0;
}
