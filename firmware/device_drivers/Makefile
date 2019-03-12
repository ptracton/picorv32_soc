CPU=RISCV

LIBRARY = lib$(CPU)_device_drivers.a

include ../environment.mk

SRC_DIR  = src
INC_DIR  = includes
OBJ_DIR  = $(CPU)_objects
DEP_DIR  = $(CPU)_dep
LIB_DIR  = $(CPU)_lib
EXEC_DIR = $(CPU)_executable
LIST_FILE = lib$(CPU).lst

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))
VPATH = $(SRC_DIR)
ELF_REQUIREMENTS = $(OBJECTS)
CINCLUDES = -I ./$(INC_DIR)
CINCLUDES += -I../$(CPU)/boot/includes/
MAKE_DIRS = $(DEP_DIR) $(LIB_DIR) $(OBJ_DIR)
CFLAGS = -O2 -g -Wall -Werror $(CINCLUDES) -D$(CPU) -std=gnu99 -fno-builtin -fomit-frame-pointer -ffunction-sections

all: dirs $(LIBRARY) $(LIST_FILE)

dirs:
	@echo "Making directories $(MAKE_DIRS)"
	@$(MKDIR) -p $(MAKE_DIRS)

$(LIBRARY): $(ELF_REQUIREMENTS)
	@echo "Building Library $(LIBRARY)"
	$(AR) cr $(LIB_DIR)/$(LIBRARY) $(ELF_REQUIREMENTS)

$(LIST_FILE): $(LIBRARY)
	@$(OBJDUMP) -d $(LIB_DIR)/$(LIBRARY) > $(LIB_DIR)/$(LIST_FILE)

$(OBJ_DIR)/%.o:%.c
	@echo "Compiling $<"
	$(CC) $(CFLAGS) -o $@ -c $< -MMD -MF $(DEP_DIR)/$(*F).d

clean:
	$(RM) -rf $(OBJ_DIR) $(DEP_DIR) $(LIB_DIR)
	find . -name "*~" | xargs rm -f
