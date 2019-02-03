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


# Status
Initial post: code simplified with some workarouds found. To be submitted to AdaCore shortly.

# Workarounds
Here are the known so far workarounds:
1. Use abstract primitives instead of null. This works, but is not ideal. Null primities are there for a purpose.

2. Use flat package structure. This seems to be triggered when derivation happens in a child package. Perhaps gnat loses track of null primitive info when processing a child package.

3. Generics: this seems not to happen when package hierarchy is not generic. If generics are used simply to select a specific data precision, consider defining
type Real is new Float;
at the top of the root package, instead of passing it as generic (this will also speed up compilation a lot). 
