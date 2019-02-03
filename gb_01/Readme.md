# Gnat bug #1: null primitives
This bug seems to be related to gnat not handling null primitive methods in a proper way.
This bug is triggered when interface having null primitive is overridden in a child package.
This is getting troggered when enclosing packages are generic. However sometimes this also 
got triggered in non-generic packages. The code demonstrating this bug is split in few subdirs,
one triggering the bug, the "sometimes" case and a workaround dir:

    - src_bug:  contains the code triggering the bug always (both generic and child packages)
    
    - src_alt1: non-generic version. 
        This code was triggering the same bug initially, but stopped (and started to output 
        proper compile error message) upon renaming the dir and sources..
        
    - src_wa1:  a workaround: flat (single) package, still generic. This seems to compile.
