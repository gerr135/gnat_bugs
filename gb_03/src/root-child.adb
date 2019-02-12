pragma Ada_2012;

with Ada.Text_IO;
package body root.child is

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer) is
        use Ada.Text_IO;
    begin
        Put_Line("Set_smth(" & smth'img & ")"); -- never gets here
        declare
            R : Repr := AB.ToRepr;
        begin
            R.smth := smth;
            AB.FromRepr(R);
        end;
    end Set_Smth;

end root.child;
