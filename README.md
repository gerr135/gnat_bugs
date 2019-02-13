# gnat_bugs
A collection of the encountered bugs in gnat compiler

## About
This is a holding place for the gnat bugs I encountered, to be reported to AdaCore. Somehow I seem to trigger gnat failures on a somewhat regular basis during design phases. This project holds a collection of the individual examples of the cleaned-up and, as much as possible, minimal code that triggers the associated bugs in gnat compiler. Each subproject will also strive to list the progress of the associated bug report and resolution, as well as present known workarounds for a specific issue.

The individual entries are organized in two classes: bugs and issues. The bugs include actual bugs - when gnat emits that bug message or generates problemmatic code. The issues are known, well, issues, when gnat generates appropriate code, according to the standard, but the specifics of implementation of some feature may cause trouble. 

## List of bugs
1. [null primitives](gb_01/)  Null primitive ops on interfaces in generic child packages seem to not be implemented properly.
2. [(minor)inheritance tracing](gb_02/) Infinite recursion while tracing inheritance


## List of issues
1. [discriminant defaults](gi_01/) Declaring unconstrained (too large) discriminated record with default
