SHELL=C:/Windows/System32/cmd.exe

ARM ?= arm-none-eabi

BUILD = build/

SOURCE = source/

TARGET = kernel.img

LINKER = kernel.ld

OBJECTS := $(patsubst $(SOURCE)%.s,$(BUILD)%.o,$(wildcard $(SOURCE)*.s))

all: $(TARGET)

rebuild: clean all

$(TARGET) : $(BUILD)output.elf
	$(ARM)-objcopy $(BUILD)output.elf -O binary boot/$(TARGET) 

$(BUILD)output.elf : $(OBJECTS) $(LINKER)
	$(ARM)-ld --no-undefined $(OBJECTS) -o $(BUILD)output.elf -T $(LINKER)

$(BUILD)%.o: $(SOURCE)%.s
	$(ARM)-as -I $(SOURCE) $< -o $@

clean : 
	-rm -f $(BUILD)*.o 
	-rm -f $(BUILD)output.elf
	-rm -f boot/$(TARGET)
