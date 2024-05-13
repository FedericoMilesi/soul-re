### Build Options ###

BASEEXE      := SLUS_007.08
TARGET       := KAIN2
COMPARE      ?= 1
NON_MATCHING ?= 0
VERBOSE      ?= 0
BUILD_DIR    ?= build

# Fail early if baserom does not exist
ifeq ($(wildcard $(BASEEXE)),)
$(error Baserom `$(BASEEXE)' not found.)
endif

# NON_MATCHING=1 implies COMPARE=0
ifeq ($(NON_MATCHING),1)
override COMPARE=0
endif

ifeq ($(VERBOSE),0)
V := @
endif

ifeq ($(OS),Windows_NT)
  DETECTED_OS=windows
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Linux)
    DETECTED_OS=linux
  endif
  ifeq ($(UNAME_S),Darwin)
    DETECTED_OS=macos
    MAKE=gmake
    CPPFLAGS += -xc++
  endif
endif

### Output ###

EXE          := $(BUILD_DIR)/$(TARGET).EXE
ELF          := $(BUILD_DIR)/$(TARGET).elf
LD_SCRIPT    := $(TARGET).ld
LD_MAP       := $(BUILD_DIR)/$(TARGET).map

### Tools ###

PYTHON     := python3
SPLAT_YAML := $(BASEEXE).yaml
SPLAT      := splat split $(SPLAT_YAML)
DIFF       := diff
MASPSX     := $(PYTHON) tools/maspsx/maspsx.py --aspsx-version=2.81

CROSS    := mips-linux-gnu-
AS       := $(CROSS)as -EL
LD       := $(CROSS)ld -EL
OBJCOPY  := $(CROSS)objcopy
STRIP    := $(CROSS)strip
CPP      := $(CROSS)cpp
CC       := tools/gcc2.8.1-mipsel/cc1

PRINT := printf '
 ENDCOLOR := \033[0m
 WHITE     := \033[0m
 ENDWHITE  := $(ENDCOLOR)
 GREEN     := \033[0;32m
 ENDGREEN  := $(ENDCOLOR)
 BLUE      := \033[0;34m
 ENDBLUE   := $(ENDCOLOR)
 YELLOW    := \033[0;33m
 ENDYELLOW := $(ENDCOLOR)
 PURPLE    := \033[0;35m
 ENDPURPLE := $(ENDCOLOR)
ENDLINE := \n'

### Compiler Options ###

ASFLAGS        := -Iinclude -march=r3000 -mtune=r3000 -no-pad-sections
CFLAGS         := -O2 -G65536 -fno-builtin -fpeephole -ffunction-cse -fkeep-static-consts -fpcc-struct-return \
                  -fcommon -fgnu-linker -msplit-addresses -mgas -mgpOPT -mgpopt -msoft-float -gcoff
CPPFLAGS       := -Iinclude
LDFLAGS        := -T undefined_syms.txt -T undefined_funcs.txt -T $(BUILD_DIR)/$(LD_SCRIPT) -Map $(LD_MAP) --no-check-sections

ifeq ($(NON_MATCHING),1)
CPPFLAGS += -DNON_MATCHING
endif

### Sources ###

# Object files
OBJECTS := $(shell grep -E 'BUILD_PATH.+\.o' $(LD_SCRIPT) -o)
OBJECTS := $(OBJECTS:BUILD_PATH/%=$(BUILD_DIR)/%)
DEPENDS := $(OBJECTS:=.d)

### Targets ###

all: $(EXE)

-include $(DEPENDS)

clean:
	$(V)rm -rf $(BUILD_DIR)

distclean: clean
	$(V)rm -f $(LD_SCRIPT)
	$(V)rm -rf asm
	$(V)rm -rf *_auto.txt

setup: distclean split

split:
	$(V)$(SPLAT)

# Compile .c files
$(BUILD_DIR)/%.c.o: %.c
	@$(PRINT)$(GREEN)Compiling C file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(V)$(CPP) $(CPPFLAGS) $< | $(CC) $(CFLAGS) | $(MASPSX) | $(AS) $(ASFLAGS) -o $@

# Compile .s files
$(BUILD_DIR)/%.s.o: %.s
	@$(PRINT)$(GREEN)Assembling asm file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(V)$(AS) $(ASFLAGS) -o $@ $<

# Create .o files from .bin files.
$(BUILD_DIR)/%.bin.o: %.bin
	@$(PRINT)$(GREEN)objcopying binary file: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	@mkdir -p $(shell dirname $@)
	$(V)$(LD) -r -b binary -o $@ $<

$(BUILD_DIR)/$(LD_SCRIPT): $(LD_SCRIPT)
	@$(PRINT)$(GREEN)Preprocessing linker script: $(ENDGREEN)$(BLUE)$<$(ENDBLUE)$(ENDLINE)
	$(V)$(CPP) -P -DBUILD_PATH=$(BUILD_DIR) $< -o $@
#Temporary hack for noload segment wrong alignment
	@sed -r -i 's/\.main_bss \(NOLOAD\) : SUBALIGN\(4\)/.main_bss main_SDATA_END (NOLOAD) : SUBALIGN(4)/g' $@

# Link the .o files into the .elf
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) $(BUILD_DIR)/$(LD_SCRIPT)
	@$(PRINT)$(GREEN)Linking elf file: $(ENDGREEN)$(BLUE)$@$(ENDBLUE)$(ENDLINE)
	$(V)$(LD) $(LDFLAGS) -o $@

# Convert the .elf to the final exe
$(EXE): $(BUILD_DIR)/$(TARGET).elf
	@$(PRINT)$(GREEN)Creating EXE: $(ENDGREEN)$(BLUE)$@$(ENDBLUE)$(ENDLINE)
	$(V)$(OBJCOPY) $< $@ -O binary
	$(V)$(OBJCOPY) -O binary --gap-fill 0x00 --pad-to 0x0C3000 $< $@
ifeq ($(COMPARE),1)
	@$(DIFF) $(BASEEXE) $(EXE) && printf "OK\n" || (echo 'The build succeeded, but did not match the base EXE. This is expected if you are making changes to the game. To skip this check, use "make COMPARE=0".' && false)
endif

### Make Settings ###

.PHONY: all clean distclean setup split

# Remove built-in implicit rules to improve performance
MAKEFLAGS += --no-builtin-rules

# Print target for debugging
print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
