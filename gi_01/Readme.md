# Gnat Issue #1: 
ARM 3.7(28): 
https://stackoverflow.com/questions/17923274/is-it-possible-to-store-a-variant-record-to-a-generic-type-in-ada
This bug is triggerred by improper iheritance specification, likely causing cyclic self-dependency.
Normally this should make gnat spit out error message and quit gracefully. Instead gnat
reports "stack overflow or erroneous memory access". Likely the code in this example
confuses gnat into going into infinite recursion, while trying to resolve inheritance.

## Status
Initial code preparation.

## Workarounds
1. Don't give default value for the discriminant. This fixes the size ..
2. Limit max size
