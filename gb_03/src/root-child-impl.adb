pragma Ada_2012;
package body root.child.impl is

    overriding
    function ToRepr (B : Base) return Repr is
        R : Repr(Natural(B.vec.Length));
    begin
        R.smth := B.smth;
        R.smth_else := B.smth_else;
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
