with Ada.Containers.Vectors;

generic
package root.child.impl is

    type Base is new Abstract_Base with private;

    overriding
    function  ToRepr(B : Base) return Repr;

    overriding
    procedure FromRepr(B : in out Base; rp : Repr);

private

    package ACV is new Ada.Containers.Vectors(Positive, Real);

    type Base is new Abstract_Base with record
        smth : Integer;
        smth_else : Real;
        vec : ACV.Vector;
    end record;

end root.child.impl;
