with Ada.Containers.Vectors;

package issue is

    type Repr is private;

    type Abstract_Base is interface;

    function  ToRepr(AB : Abstract_Base) return Repr is abstract;
    procedure FromRepr(AB : in out Abstract_Base; rp : Repr) is abstract;

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer);

    -----------------------------------------------
    type Base is new Abstract_Base with private;

    overriding
    function  ToRepr(B : Base) return Repr;

    overriding
    procedure FromRepr(B : in out Base; R : Repr);

private

    type Smth_Array is array (Positive range <>) of Integer;

    type Repr(Size : Natural := 1) is record
        smth : Integer;
        sa : Smth_Array(1..Size);
    end record;

    ----------------------------------------------------------------
    package ACV is new Ada.Containers.Vectors(Positive, Integer);

    type Base is new Abstract_Base with record
        smth : Integer;
        sv : ACV.Vector;
    end record;

end issue;
