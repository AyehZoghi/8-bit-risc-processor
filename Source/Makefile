# file extensions
VLG_EXT := v
DUMP_EXT := vcd
TEST_EXT := tb

# dump macro specified in verilog files for dump file
DUMP_MACRO := DUMP

# standard directories
HDL_DIR := hdl
TEST_DIR := test
DUMP_DIR := sim

# engines and compilers
VLG := iverilog
VVP := vvp

# sources
TEST_SRCS := $(shell find $(TEST_DIR) -name "*.$(TEST_EXT).$(VLG_EXT)")
HDL_SRCS := $(shell find $(HDL_DIR) -name "*.$(VLG_EXT)")
TEST_DUMPS := $(TEST_SRCS:$(TEST_DIR)/%.$(TEST_EXT).$(VLG_EXT)=$(DUMP_DIR)/%.$(DUMP_EXT))

test: $(TEST_DUMPS)

$(DUMP_DIR)/%.$(DUMP_EXT): $(DUMP_DIR)/%
	@mkdir -p $(dir $@)
	$(VVP) $<
	@rm $<

$(DUMP_DIR)/%: $(TEST_DIR)/%.$(TEST_EXT).$(VLG_EXT) $(HDL_SRCS)
	@mkdir -p $(dir $@)
	$(VLG) -D$(DUMP_MACRO)="\"$@.$(DUMP_EXT)"\" -o $@ $<

clean:
	rm -rf $(DUMP_DIR)
