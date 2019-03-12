################################################################################
#
# Set up your environment paths
#
################################################################################

##
## Prefix of the GCC LM32 Cross Compiler
##
ifeq ($(CPU), LM32)
PREFIX	= lm32-elf
endif

ifeq ($(CPU), MOR1K)
PREFIX	= or1k-elf
endif

ifeq ($(CPU), RISCV)
PREFIX	= riscv32-unknown-elf
endif


##
## Tools we use for building
##
CC	    = $(PREFIX)-gcc
LD	    = $(PREFIX)-gcc
ASM     = $(PREFIX)-as
OBJCOPY	= $(PREFIX)-objcopy
OBJDUMP	= $(PREFIX)-objdump
AR     	= $(PREFIX)-ar
GDB	    = $(PREFIX)-gdb
FLASH	= $(shell which st-flash)
MKDIR   = mkdir
RM      = rm
