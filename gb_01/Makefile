TARGET = run_gb_01
SOURCES = src_bug/*.ad?
SRC_ALT1 = src_alt1/*.ad?
SRC_WA1 = src_wa1/*.ad?

# rule to link the program
gb_01: $(SOURCES)
	gprbuild -P gb_01.gpr

alt1:  $(SRC_ALT1)
	gprbuild -P gb_01_alt1.gpr

wa1:  $(SRC_WA1)
	gprbuild -P gb_01_wa1.gpr


clean:
	rm obj/*/*

.PHONEY: clean
