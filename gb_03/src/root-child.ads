generic
package root.child is

    type Repr is private;

    type Abstract_Base is abstract tagged record
        smth : Integer;
    end record;

    function  ToRepr(AB : Abstract_Base) return Repr is abstract;
    procedure FromRepr(AB : in out Abstract_Base; rp : Repr) is abstract;

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer);

private

    type Repr(param : Integer := 0) is record
        smth : Integer;
        smth_else : Real;
    end record;

end root.child;
