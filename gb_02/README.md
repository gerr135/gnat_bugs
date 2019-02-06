# Gnat bug #2: infinite recursion while tracing inheritance
This bug is triggerred by improper iheritance specification, likely causing cyclic self-dependency.
Normally this should make gnat spit out error message and quit gracefully. Instead gnat
reports "stack overflow or erroneous memory access". Likely the code in this example
confuses gnat into going into infinite recursion, while trying to resolve inheritance.

## Priority
Low, trigerred by errorneous code.

## Status
Initial code preparation.

## Workarounds
None, and not necessary. This is caused by errorneous code. However gnat should stop gracefully,
instead of going itno infinite recusrion and dying.

## Bug message
A specific bug message that is triggered:
```
gprbuild -P gb_02.gpr
Compile
   [Ada]          run_gb_02.adb
+===========================GNAT BUG DETECTED==============================+
| Community 2018 (20180524-73) (x86_64-pc-linux-gnu) Storage_Error stack overflow or erroneous memory access|
| Error detected at lists-dynamic.adb:42:9 [run_gb_02.adb:18:5]            |
| Please submit a bug report by email to report@adacore.com.               |
| GAP members can alternatively use GNAT Tracker:                          |
| http://www.adacore.com/ section 'send a report'.                         |
| See gnatinfo.txt for full info on procedure for submitting bugs.         |
| Use a subject line meaningful to you and us to track the bug.            |
| Include the entire contents of this bug box in the report.               |
| Include the exact command that you entered.                              |
| Also include sources listed below.                                       |
| Use plain ASCII or MIME attachment(s).                                   |
+==========================================================================+

Please include these source files with error report
Note that list may not be accurate in some cases,
so please double check that the problem can still
be reproduced with the set of files listed.
Consider also -gnatd.n switch (see debug.adb).

/home/gerr/comp/kdevel/ada/gnat_bugs/gb_02/src_bug/run_gb_02.adb
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_02/src_bug/lists.ads
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_02/src_bug/lists-dynamic.ads
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_02/src_bug/lists-dynamic.adb
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_02/src_bug/lists.adb

run_gb_02.adb:18:05: warning: in instantiation at lists-dynamic.adb:42
run_gb_02.adb:18:05: warning: type in allocator has deeper level than designated class-wide type
run_gb_02.adb:18:05: warning: Program_Error will be raised at run time
compilation abandoned
gprbuild: *** compilation phase failed
make: *** [Makefile:8: gb_01] Error 4
```
