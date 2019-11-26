# Gnat Issue #1: declaring unconstrained (too large) discriminated record with default
Ada allows to declare unconstrained variables of discriminated record when discriminant
has the default set. See ARM 3.7(28).
In such case, the discriminant value, as well as the size of dependant entries, can change.
This is done by replacing an entire record (so all values have to be set at once).
This works to allow dynamic data (and remove the need to use explicit dynamic allocation in many scenarios),
however the implementation details can differ from compiler to compiler.
In the case of gnat, this is implemented by simply reserving max possible size for the record.
Thus, if the record contains e.g. an array of dynamic size, indexed by e.g. Natural, this would cause
stack overflow on most systems when trying to declare a var of such type.

This issue demonstrates the (not completely trivial) use case when data is passed around
using a private discriminated record. In such cases it makes sense to hide discriminants
to prevent external data mangling (as there is no need to expose this info). The natural
instinct may be here just to give the discriminant(s) default value(s) and be done with it.
This, howerver, triggers run-time Storage_Error that may be non-trivial to track (and gnat
may not always produce a proper warning in big projects, or they can be lost in the long
stream of other warnings..).

## Workarounds
Multiple workarounds are possible. Two simplest and most common are given below, and demonstrated
in the code.
1. Don't give default value for the discriminant. Define record with (<>) in public part.
    This prohibits dynamic change of record size and forces to give a proper initialization
    to the variable at the point of declaration (by either providing discriminant values or
    a proper "constructor"). This may feel more cumbersome than the other workaround, but
    produces more efficient run-time behavior and usually forces better design.
2. Limit max size of the record entries. See wa1 sources for this example.
    This can be done by defining and using an appropriate subtype in place of generic Natural
    or Positive as dynamic array index for the discriminated record entries. See wa2 sources
    for this example.

## Sample code structure
The demo code for the issue and workarounds is in the separate packages:
- issue.ad?  the code that causes this issue byt trying to allocate array indexed by Positive
- wa1.ad?    the code for the workaround 1 (discriminants without default values)
- wa2.ad?    the code for the workaround 2 (constrained array index)
