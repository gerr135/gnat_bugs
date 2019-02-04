# Gnat bug #1: null primitives
This bug seems to be related to gnat not handling null primitive methods in a proper way.
This bug is triggered when interface having null primitive is overridden in a child package.
The specific bug message is listed below, under [bug message](#Bug-message).
This is getting troggered when enclosing packages are generic. However sometimes this also 
got triggered in non-generic packages. The code demonstrating this bug is split in few subdirs,
one triggering the bug, the "sometimes" case and a workaround dir:

    - src_bug:  contains the code triggering the bug always (both generic and child packages)
    
    - src_alt1: non-generic version. 
        This code was triggering the same bug initially, but stopped (and started to output 
        proper compile error message) upon renaming the dir and sources..
        
    - src_wa1:  a workaround: flat (single) package, still generic. This seems to compile.


# Status
Initial post: code simplified with some workarouds found. To be submitted to AdaCore shortly.

# Workarounds
Here are the known so far workarounds:
1. Use abstract primitives instead of null. This works, but is not ideal. Null primities are there for a purpose.

2. Use flat package structure. This seems to be triggered when derivation happens in a child package. Perhaps gnat loses track of null primitive info when processing a child package.

3. Generics: this seems not to happen when package hierarchy is not generic. If generics are used simply to select a specific data precision, consider defining
type Real is new Float;
at the top of the root package, instead of passing it as generic (this will also speed up compilation a lot). 

#Bug message
A specific bug message that is triggered:
'''
gprbuild -P gb_01.gpr
Compile
   [Ada]          run_gb_01.adb
+===========================GNAT BUG DETECTED==============================+
| Community 2018 (20180524-73) (x86_64-pc-linux-gnu) GCC error:            |
| in gnat_to_gnu_entity, at ada/gcc-interface/decl.c:429                   |
| Error detected at root-child.ads:6:5 [run_gb_01.adb:13:5]                |
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

/home/gerr/comp/kdevel/ada/gnat_bugs/gb_01/src_bug/run_gb_01.adb
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_01/src_bug/root.ads
/home/gerr/comp/kdevel/ada/gnat_bugs/gb_01/src_bug/root-child.ads

compilation abandoned
gprbuild: *** compilation phase failed
make: *** [Makefile:8: gb_01] Error 4
'''
A quick pick into a references file 'ada/gcc-interface/decl.c:429' suggests that gnat does not know how to handle the situation. Possibly some info from the base interface definition has not been retained..
