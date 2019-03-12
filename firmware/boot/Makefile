CPU=RISCV
include ../environment.mk


TARGET = boot
LIBRARY = libriscvboot.a

##
## Project Directories
##
SRC_DIR = src
OBJ_DIR = objects
INC_DIR = includes
LIB_DIR = lib
DEP_DIR = dep
LD_DIR = linker

SOURCES          += $(wildcard $(SRC_DIR)/*.c)
OBJECTS          += $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))
ELF_REQUIREMENTS += $(OBJECTS)
VPATH            += $(SRC_DIR)
CINCLUDES        += -I$(INC_DIR)


##
## The files we are creating
##
LIST_FILE = $(LIB_DIR)/$(TARGET).lst
HEX_FILE  = $(LIB_DIR)/$(TARGET).hex
SREC_FILE = $(LIB_DIR)/$(TARGET).srec
BIN_FILE  = $(LIB_DIR)/$(TARGET).bin

##
## Start up file
##
#ASM_SOURCES      += src/crt0ram.S 
#ASM_OBJECTS      += $(OBJ_DIR)/crt0ram.o
ASM_SOURCES      += src/crt0.S 
ASM_OBJECTS      += $(OBJ_DIR)/start.o $(OBJ_DIR)/custom_ops.o
ELF_REQUIREMENTS += $(ASM_OBJECTS)
ASMFLAGS         += -march=rv32imc 

##
## Linker flags
##
LDFLAGS = -T$(LD_DIR)/linker.ld -nostdlib -lgcc 
CFLAGS  = -g $(CINCLUDES) -march=rv32imc 
#CFLAGS += -m32 -mno-fdiv  -msoft-float
CFLAGS += -Werror -Wall -Wextra -Wshadow -Wundef -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings
CFLAGS += -Wredundant-decls -Wstrict-prototypes -Wmissing-prototypes -pedantic # -Wconversion


##
## The directories to make for this build.
##
MAKE_DIRS += $(OBJ_DIR) $(DEP_DIR) $(LIB_DIR)

all: dirs $(LIB_DIR)/$(LIB_FILE) 

dirs:
	@echo "Making directories $(MAKE_DIRS)"
	$(MKDIR) -p $(MAKE_DIRS)

##
## Link together the executable
##
$(LIB_DIR)/$(LIB_FILE): $(ELF_REQUIREMENTS)
	@echo "Create Library $(LIBRARY)"
	$(AR) cr $(LIB_DIR)/$(LIBRARY) $(ELF_REQUIREMENTS)


##
## Turn out ASM code into objects in our $(OBJ_DIR)
##
$(OBJ_DIR)/%.o:%.S
	@echo "Assembling $<"
	$(CC) $(ASMFLAGS)   $< -c  -o $@

##
## Turn out C code into objects in our $(OBJ_DIR)
##
$(OBJ_DIR)/%.o:%.c
	@echo "Compiling  $<"
	$(CC) $(CFLAGS) -o $@ -c $< -MMD -MF dep/$(*F).d

clean:
	$(RM) -rf  $(OBJ_DIR) $(EXEC_DIR) $(DEP_DIR) $(LIB_DIR)
	find . -name "*~" | xargs $(RM) -f
	$(RM) -f TAGS	
