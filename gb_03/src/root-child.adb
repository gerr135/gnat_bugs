pragma Ada_2012;
package body root.child is

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer) is
        R : Repr := AB.ToRepr;
    begin
        R.smth := smth;
        AB.FromRepr(R);
    end Set_Smth;

end root.child;
