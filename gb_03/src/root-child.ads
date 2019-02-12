generic
package root.child is

    type Repr is private;

    type Abstract_Base is interface;

    function  ToRepr(AB : Abstract_Base) return Repr is abstract;
    procedure FromRepr(AB : in out Abstract_Base; rp : Repr) is abstract;

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer);

private

    type Smth_Array is array (Positive range <>) of Integer;
    
    type Repr(Size : Natural := 0) is record
        smth : Integer;
        sa : Smth_Array(1..Size);
    end record;

end root.child;
