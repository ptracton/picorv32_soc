
#include "wb_soc_template.h"
#include "fw_interface.h"
#include "string.h"


void FW_report(volatile FW_INTERFACE_REGS_TypeDef * dev, const char* message, uint32_t report){
  uint32_t i;

  size_t str_size;

  str_size = strnlen(message, FW_INTERFACE_MAX_CHARS);
  if (str_size > FW_INTERFACE_MAX_CHARS){
    str_size = FW_INTERFACE_MAX_CHARS;
  }

  dev->report = report;
  i =0;

  while ((i < str_size )){
    //while (i <  FW_INTERFACE_MAX_CHARS){
    dev->string[i] = message[i];
    i++;
  }
  dev->control = FW_INTERFACE_CONTROL_REG_NEW_REPORT;
  dev->control = 0;
  return;
}

void FW_warning(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t warning){
  uint32_t i=0;
  dev->warning = (uint32_t) warning;
  while ((*message != 0) && (i < FW_INTERFACE_MAX_CHARS )){
    dev->string[i] = (uint8_t) *message++;
    i++;
  }
  dev->control = (uint32_t) FW_INTERFACE_CONTROL_REG_NEW_REPORT ;
  dev->control = (uint32_t) 0;

  return;
}

  void FW_error(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t error){
  uint32_t i=0;
  FW_IF->error = (uint32_t) error;
  while ((*message != 0) && (i < FW_INTERFACE_MAX_CHARS )){
    dev->string[i] = (uint8_t) *message++;
    i++;
  }
  dev->control = (uint32_t) FW_INTERFACE_CONTROL_REG_NEW_REPORT ;
  dev->control = (uint32_t) 0;

  return;
}

void FW_compare(volatile FW_INTERFACE_REGS_TypeDef * dev, const char * message, uint32_t measured, uint32_t expected){
  uint32_t i=0;

  static size_t str_size;
  str_size = strlen(message);
  if (str_size > FW_INTERFACE_MAX_CHARS){
    str_size = FW_INTERFACE_MAX_CHARS;
  }

  dev->measured = measured;
  dev->expected = expected;
  i =0;
  while ((i < str_size )){
    dev->string[i] = *message ++;
    i++;
  }

  dev->control = FW_INTERFACE_CONTROL_REG_NEW_COMPARE;
  dev->control = 0;
  return;
}

void FW_trigger(volatile FW_INTERFACE_REGS_TypeDef * dev, uint32_t trigger){
  dev->trigger = trigger;
  return;
}

void FW_Init(volatile FW_INTERFACE_REGS_TypeDef * dev){
  uint32_t i;

  for (i=0; i< FW_INTERFACE_MAX_CHARS; i++){
    dev->string[i] = 'a'+i;
  }
}
