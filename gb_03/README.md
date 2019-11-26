# Gnat bug #3: gnat cannot handle tagged type hierarchy as discriminated record entry
This happens while trying to have a tagged type hierarchy, rooted in an interface, as a filed of a discriminated record.
Stabdalone variables work fin, just as a field of an undiscriminated record.

## Priority
High, legitimate code representing what should be a common scenario breaks gnat.

## Status
Initial code preparation.

## Workarounds
Avoid discriminants passed to the type hierarchy? That pretty much means avoiding fixed/bounded list implementations for now..

## Bug message
A specific bug message that is triggered:
```
gprbuild -P gb_03.gpr
Compile
   [Ada]          bug_03.adb
+===========================GNAT BUG DETECTED==============================+
| Community 2019 (20190517-83) (x86_64-pc-linux-gnu) Storage_Error stack overflow or erroneous memory access|
| Error detected at bug_03.adb:76:12                                       |
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

/home/gerr/comp/kdevel/ada/gnat_bugs/gb_03/src/bug_03.adb
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_03/src/lists.ads
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_03/src/lists-fixed.ads
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_03/src/lists-dynamic.ads

compilation abandoned
gprbuild: *** compilation phase failed
make: *** [Makefile:6: all] Error 4
```
