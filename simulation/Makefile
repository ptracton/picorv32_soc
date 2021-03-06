CPU = RISCV
TARGET = none
TEST_CASE = $(basename $(TARGET))
TEST_CASE_SRC = $(TEST_CASE).c
TEST_CASE_OBJ = $(TEST_CASE).o
ELF_REQUIREMENTS = $(TEST_CASE_OBJ) 
ELF_FILE  = $(TEST_CASE).elf
LIST_FILE = $(TEST_CASE)_$(CPU).lst
VH_FILE = $(TEST_CASE).vh
ENTRY_POINT = ../firmware/boot/objects/start.o

FIRMWARE_ROOT = ../firmware
FIRMWARE_CPU_ROOT = $(FIRMWARE_ROOT)/
LIB_BOOT = lriscvboot
LIB_BOOT_DIR = $(FIRMWARE_CPU_ROOT)/boot/lib

DEVICE_DRIVERS_DIR     = $(FIRMWARE_ROOT)/device_drivers
DEVICE_DRIVERS_INC_DIR = $(DEVICE_DRIVERS_DIR)/includes
DEVICE_DRIVERS_LIB_DIR = $(DEVICE_DRIVERS_DIR)/RISCV_lib/
DEVICE_DRIVERS_LIB = RISCV_device_drivers

CINCLUDES = -I $(DEVICE_DRIVERS_INC_DIR) -I $(FIRMWARE_CPU_ROOT)/boot/includes
CFLAGS += $(CINCLUDES) -g -D$(CPU)  -march=rv32imc 
CFLAGS += -Werror -Wall -Wextra -Wshadow -Wundef -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings
CFLAGS += -Wredundant-decls -Wstrict-prototypes -Wmissing-prototypes -pedantic # -Wconversion
LD_FLAGS = -nostdlib -T$(FIRMWARE_CPU_ROOT)/linker/riscv.ld -L $(DEVICE_DRIVERS_LIB_DIR) -l$(DEVICE_DRIVERS_LIB) -lc

include $(FIRMWARE_CPU_ROOT)/environment.mk

all: $(LIST_FILE) $(VH_FILE)

$(LIST_FILE): $(ELF_FILE)
	@echo "List File: $(LIST_FILE)"
	@$(OBJDUMP) -xStsd $(ELF_FILE) > $(LIST_FILE)

$(ELF_FILE): $(ELF_REQUIREMENTS)
	@$(MAKE) -C ../firmware/device_drivers CPU=RISCV
	@$(MAKE) -C ../firmware/boot/
	@echo "Linking $(ELF_FILE)"
	$(LD) -o $(ELF_FILE) $(ENTRY_POINT)  $(ELF_REQUIREMENTS)  $(LD_FLAGS) 

%.vh: %.elf
	@echo "Create srec "
	@$(OBJCOPY) -O srec $< $@.tmp
	srec_cat $@.tmp --byte-swap 4 --output  $@.swap
	@echo "Create .mem file"
	srec_cat $@.swap  -fill 0x00 --within $@.swap --range-padding 4   --output $@.mem --VMEM 4
#	$(FIRMWARE_CPU_ROOT)/tools/makehex.py $< 16384 > $@.makehex.mem

%.o:%.c
	@echo "Compiling  $<"
	$(CC) $(CFLAGS) -o $@ -c $< -MMD -MF $(*F).d

clean:
	$(RM) -f $(ELF_FILE) $(TARGET).d $(LIST_FILE) $(TEST_CASE_OBJ) *.bin  *~
	$(MAKE) -C ../firmware/device_drivers CPU=RISCV clean
	$(MAKE) -C ../firmware/boot/ clean
