TARGET = run_gb_02
SOURCES = src_bug/*.ad?

# rule to link the program
gb_01: $(SOURCES)
	gprbuild -P gb_02.gpr

clean:
	rm obj/*/*

.PHONEY: clean
