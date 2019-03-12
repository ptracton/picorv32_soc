#include "wb_soc_template.h"

uint8_t byte;

int main(void){
  uint32_t i;
  /* UART->reg0.data = 0xAA; */
  /* UART->reg1.interrupt_enable |= 0x1F; */
  /* UART->reg2.fifo_control = 0x03; */
  /* while(1); */

  FW_Init(FW_IF);
  FW_report(FW_IF, "UART INIT", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
  UART16550_Init(UART);
  FW_report(FW_IF, "TX 0", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
  UART16550_TransmitByte(UART, '0');
  FW_report(FW_IF, "TX 1", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
  UART16550_TransmitByte(UART, '1');
  FW_report(FW_IF, "TX 2", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
  UART16550_TransmitByte(UART, '2');
  FW_report(FW_IF, "TX 3", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
  UART16550_TransmitByte(UART, '3');


  i = 0;
  while(1){
    i++;
    FW_trigger(FW_IF, i);
    FW_report(FW_IF, "Boot Rom Loop", FW_INTERFACE_CONTROL_REG_NEW_REPORT);
    FW_trigger(FW_IF, 0);
    //    uint8_t byte;
    //    UART16550_PollForReceive(UART);
    //    UART16550_ReceiveByte(UART, &byte);
    //    UART16550_TransmitByte(UART, byte);
  }

  return 0;
}
