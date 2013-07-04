ARMGNU ?= arm-none-eabi

BUILD = build/
SOURCE = source/
BOOT = boot/
TARGET = kernel.img
LIST = kernel.list
LINKER = kernel.ld

OBJECTS := $(patsubst $(SOURCE)%.s,$(BUILD)%.o,$(wildcard $(SOURCE)*.s))
OBJECTS += $(patsubst $(SOURCE)%.c,$(BUILD)%.o,$(wildcard $(SOURCE)*.c))

all : $(TARGET) $(LIST)

$(LIST) : $(BUILD)output.elf
	$(ARMGNU)-objdump -d $(BUILD)output.elf > $(LIST)

$(TARGET) : $(BUILD)output.elf
	$(ARMGNU)-objcopy $(BUILD)output.elf -O binary $(BOOT)$(TARGET)

$(BUILD)output.elf : $(OBJECTS) $(LINKER)
	$(ARMGNU)-ld --no-undefined $(OBJECTS) -o $(BUILD)output.elf -T $(LINKER)

$(BUILD)%.o : $(SOURCE)%.s
	$(ARMGNU)-gcc -c $< -o $@

$(BUILD)%.o : $(SOURCE)%.c
	$(ARMGNU)-gcc -c $< -o $@

clean :
	rm -f $(BUILD)*
	rm -f $BOOT$(TARGET)
	rm -f $(LIST)
