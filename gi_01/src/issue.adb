pragma Ada_2012;

with Ada.Text_IO;
package body issue is

    procedure Set_Smth (AB : in out Abstract_Base'Class; smth : Integer) is
        use Ada.Text_IO;
    begin
        Put_Line("  Set_smth(" & smth'img & ")"); -- never gets here
        declare
            R : Repr := AB.ToRepr;
        begin
            R.smth := smth;
            AB.FromRepr(R);
        end;
    end Set_Smth;

    overriding
    function ToRepr (B : Base) return Repr is
        R : Repr(Natural(B.sv.Length));
        use Ada.Text_IO;
    begin
        Put_Line("    ToRepr");
        R.smth := B.smth;
        for i in 1 .. Integer(B.sv.Length) loop
            R.sa(i) := B.sv(i);
        end loop;
        return R;
    end ToRepr;

    overriding
    procedure FromRepr (B : in out Base; R : Repr) is
        use Ada.Text_IO;
    begin
        Put_Line("    FromRepr");
        B.smth := R.smth;
        for i in 1 .. R.sa'Length loop
            B.sv(i) := R.sa(i);
        end loop;
    end FromRepr;

end issue;
