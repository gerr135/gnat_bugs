with Ada.Containers.Vectors;

package root.child is

    type Base is new Abstract_Base with private;

    overriding
    function  ToRepr(B : Base) return Repr;

    overriding
    procedure FromRepr(B : in out Base; rp : Repr);

private

    package ACV is new Ada.Containers.Vectors(Positive, Integer);

    type Base is new Abstract_Base with record
        smth : Integer;
        sv : ACV.Vector;
    end record;

end root.child;
