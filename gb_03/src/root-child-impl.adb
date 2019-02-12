pragma Ada_2012;

with Ada.Text_IO;

package body root.child.impl is

    overriding
    function ToRepr (B : Base) return Repr is
        R : Repr(Natural(B.sv.Length));
        use Ada.Text_IO;
    begin
        Put_Line("ToRepr");
        R.smth := B.smth;
        return R;
    end ToRepr;

    overriding
    procedure FromRepr (B : in out Base; rp : Repr) is
    begin
        --  Generated stub: replace with real body!
        pragma Compile_Time_Warning (Standard.True, "FromRepr unimplemented");
        raise Program_Error with "Unimplemented procedure FromRepr";
    end FromRepr;

end root.child.impl;
